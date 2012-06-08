class ApplicationController < ActionController::Base
  include Facebooker2::Rails::Controller

  helper :all

  protect_from_forgery

  before_filter :current_user
  before_filter :set_locale




  def force_user_reload!
    @current_user     = nil
    session[:user_id] = nil
  end

  def current_user
    @current_user ||= find_user_from_session || find_or_create_user_from_facebook
  end

  def find_user_from_session
    User.find_by_id(session[:user_id])  if session[:user_id]
  end

  def find_or_create_user_from_facebook
    user = User.find_or_create_from_facebook( current_facebook_user.fetch )
    user.facebook_user = current_facebook_user
    session[:user_id] = user.id
    user
  rescue NoMethodError => e
    redirect_to please_login_url and return
  end

  def set_locale
    I18n.locale = I18n.available_locales.include?(@current_user.short_locale.to_sym) ? @current_user.short_locale : :en
  end


end
