class LoginController < ApplicationController
  
  def index
    @users          = User.order('score DESC').limit(25)
    @games          = Game.pending.order('start_at')
    @current_games  = Game.running.order('start_at')
    @next_game      = @games.first
    @bets           = current_user.fetch_bets
  end
  
end
