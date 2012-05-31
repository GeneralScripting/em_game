class BetsController < ApplicationController

  layout false

  def new
    @game = Game.find( params[:game_id] )
    @bet  = current_user.bets.new(:game => @game)
  end

  def create
    @bet = current_user.bets.new( params[:bet] )
    @bet.save
    @game = Game.find( params[:bet][:game_id] )
     if current_facebook_user
          current_facebook_user.fetch
          current_facebook_user.feed_create(
            Mogli::Post.new(:message => "#{current_facebook_user.name} tippt: #{t(@game.team_a.country, :scope => 'countries')} #{@bet.team_a_goals} : #{@bet.team_b_goals} #{t(@game.team_b.country, :scope => 'countries')}")
            )
      end
    @game = @bet.game
    current_user.reload
  end

  def edit
    @bet  = current_user.bets.find( params[:id] )
    @game = @bet.game
  end

  def update
    @bet = current_user.bets.find( params[:id] )
    @bet.update_attributes( params[:bet] )
    @game = @bet.game
    current_user.reload
  end

  def destroy
    @bet  = current_user.bets.find( params[:id] )
    @game = @bet.game
    @bet.destroy
    current_user.reload
  end

end
