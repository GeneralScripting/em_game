class ApplicationController < ActionController::Base
  include Facebooker2::Rails::Controller

  helper :all

  protect_from_forgery

  before_filter :redirect_unless_in_facebook
  before_filter :current_user
  before_filter :set_locale




  def redirect_unless_in_facebook
    redirect_to 'https://apps.facebook.com/em_game/'  if current_facebook_user.nil?
  end

  def current_user
    @current_user ||= User.find_or_create_from_facebook( current_facebook_user.fetch )
  end

  def set_locale
    I18n.locale = I18n.available_locales.include?(@current_user.short_locale.to_sym) ? @current_user.short_locale : :en
  end

end
