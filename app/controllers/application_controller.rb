class ApplicationController < ActionController::Base
  include Facebooker2::Rails::Controller

  helper :all

  protect_from_forgery

  before_filter :user






  def user
    @user ||= User.find_or_create_from_facebook( current_facebook_user.fetch )
  end

end
