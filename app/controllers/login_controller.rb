class LoginController < ApplicationController
  
  def index
    @games = Game.unfinished.order('start_at').limit(20)
    @users = User.order('score DESC').limit(10)
    @games = Game.order('DAY(start_at), start_at DESC').all
  end
  
end
