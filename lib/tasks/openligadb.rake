namespace :openliga do

  desc "sync with openligadb"
  task :sync => :environment do
    unless Game.without_oldb_idx.empty? && Game.running.empty?
      require 'openligadb'
      liga = OpenLigaDB.new
      response = liga.request('matchdata_by_group_league_saison',
                                'group_order_id' => 1,
                                'league_saison' => 2012,
                                'league_shortcut' => 'em12')
      I18n.locale = :de
      raise response[:matchdata].first.inspect
      Game.without_oldb_idx.each do |game|
        oldb_round = game.group ? 'Vorrunde' : 'TODO'
        oldb_team1 = I18n.t(game.team_a.country, :scope => 'countries')
        oldb_team2 = I18n.t(game.team_b.country, :scope => 'countries')
        oldb_match = response[:matchdata].select {|m| m[:group_name].eql?(oldb_round) && m[:name_team1].eql?(oldb_team1) && m[:name_team2].eql?(oldb_team2) }.first
        if oldb_match
          game.update_attribute(:oldb_idx, oldb_match[:match_id])
        else
          puts "could not find match #{game.id} (#{oldb_round}: #{oldb_team1} vs. #{oldb_team2})"
        end
      end
      live_updates = []
      Game.running.each do |game|
        raise "game #{game.id} has not oldb_idx!" unless game.oldb_idx
        oldb_match = response[:matchdata].select {|m| m[:match_id].eql?(game.oldb_idx) }.first
        game.update_from_oldb( oldb_match )
        game.end_at = Time.current            if oldb_match[:match_is_finished]
        if game.team_a_goals_changed? || game.team_b_goals_changed? || game.end_at_changed?
          live_updates << { :game_id => game.id, :team_a => game.team_a_goals, :team_b => game.team_b_goals, :ended => game.ended? }
        end
        game.save!
      end
      unless live_updates.empty?
        begin
          channel = 'em_game_updates'
          NginxStreamPusher::publish!(channel, { :updates => live_updates }.to_json)
        rescue Timeout::Error, Errno::EINVAL, Errno::ECONNRESET, EOFError, Net::HTTPBadResponse, Net::HTTPHeaderSyntaxError, Net::ProtocolError => e
          # report but ignore
          Airbrake.notify(e)
        end
      end
    end
  end

end