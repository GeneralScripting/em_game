class ChatMessage < ActiveRecord::Base

  ICONS = [:ball, :smile, :sad, :laugh, :wink, :tongue, :coffee, :thumb_up, :thumb_down, :world, :music, :sun, :rain, :cloudy, :clouds, :lightning, :warn]

  attr_accessible :body, :user

  # relations
  belongs_to :user

  # validations
  validates :user, :body, :presence => true

  # hooks
  after_create :broadcast



  def author_name
    user.first_name
  end

  def author_locale
    user.short_locale
  end

  def html_body
    body.gsub(/:([a-z]{2}):/, '<span class="flag \1" />').gsub(/:(#{ICONS.join('|')}):/, '<span class="\1" />').gsub(/\n/, '<br />')
  end

  def self.json_options
    { :methods => [:author_name, :author_locale, :html_body], :only => [] }
  end



 protected

  def broadcast
    begin
      channel = 'em_chat'
      #NginxStreamPusher::publish!(channel, { :author => author_name, :locale => author_locale, :text => html_body }.to_json)
      NginxStreamPusher::publish!(channel, self.to_json(ChatMessage.json_options))
    rescue Errno::ECONNREFUSED, Timeout::Error, Errno::EINVAL, Errno::ECONNRESET, EOFError, Net::HTTPBadResponse, Net::HTTPHeaderSyntaxError, Net::ProtocolError => e
      # report but ignore
      Airbrake.notify(e)
    end
  end

end
