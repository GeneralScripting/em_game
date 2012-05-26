class LoginController < ApplicationController
  
  def index
    @users = User.order('score DESC').limit(10)
    @games = Game.order('DAY(start_at), start_at DESC').all
  end
  
end
