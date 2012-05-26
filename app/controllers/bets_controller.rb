class BetsController < ApplicationController

  layout false

  def new
    @game = Game.find( params[:game_id] )
    @bet  = current_user.bets.new(:game => @game)
  end

  def create
    @bet = current_user.bets.new( params[:bet] )
    @bet.save
    @game = @bet.game
    current_user.reload
  end

  def edit
    @bet  = current_user.bets.find( params[:id] )
    @game = @bet.game
  end

  def update
    @bet = current_user.bets.find( params[:id] )
    @bet.update_attributes( params[:bet] )
    @game = @bet.game
    current_user.reload
  end

  def destroy
    @bet  = current_user.bets.find( params[:id] )
    @game = @bet.game
    @bet.destroy
    current_user.reload
  end

end
