class LoginController < ApplicationController
  
  def index
    @users = User.order('score DESC').limit(10)
  end
  
end
