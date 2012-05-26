class LoginController < ApplicationController
  
  def index
    @users = User.order('score DESC').limit(25)
    @games = Game.unfinished.order('start_at')
    @bets  = current_user.fetch_bets
  end
  
end
