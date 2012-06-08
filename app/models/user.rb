class User < ActiveRecord::Base
  attr_accessible :email, :facebook_idx, :first_name, :last_name, :score, :image_url, :large_image_url, :small_image_url, :square_image_url, :username, :locale

  attr_accessor :facebook_user

  # relations
  has_many :bets
  has_many :chat_messages

  # validations
  validates :email, :first_name, :last_name, :facebook_idx, :locale, :presence => true

  # plugins
  rank_by :score

  def self.find_or_create_from_facebook(facebook_user)
    find_by_facebook_idx( facebook_user.id ) || create!(
      :email            => facebook_user.email,
      :first_name       => facebook_user.first_name,
      :last_name        => facebook_user.last_name,
      :username         => facebook_user.username,
      :image_url        => facebook_user.image_url,
      :large_image_url  => facebook_user.large_image_url,
      :small_image_url  => facebook_user.small_image_url,
      :square_image_url => facebook_user.square_image_url,
      :locale           => facebook_user.locale,
      :facebook_idx     => facebook_user.id
    )
  end

  def self.score_change!
    begin
      channel = 'em_score_updates'
      NginxStreamPusher::publish!(channel, { :update => true }.to_json)
    rescue Errno::ECONNREFUSED, Timeout::Error, Errno::EINVAL, Errno::ECONNRESET, EOFError, Net::HTTPBadResponse, Net::HTTPHeaderSyntaxError, Net::ProtocolError => e
      # report but ignore
      Airbrake.notify(e)
    end
  end


  def percent_bet
    @percent_bet ||= ((bets.for_game(Game.pending.pluck(:id)).count / Game.pending.count.to_f) * 100).round
  end



  def short_locale
    locale ? locale.to_s[0..1] : :en
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  def fetch_bets
    Rails.cache.fetch(['user_bets', cache_key].join('/')) { bets.all }
  end


  def update_score!
    self.score = bets.scored.sum(:score)
    save!
  end


end
