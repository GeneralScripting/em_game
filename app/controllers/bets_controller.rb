class BetsController < ApplicationController
  prepend_before_filter :force_user_reload!,          :only => [:create, :update]

  layout false

  def new
    @game = Game.find( params[:game_id] )
    @bet  = current_user.bets.new(:game => @game)
    @bet.post_on_facebook = true
  end

  def create
    @bet = current_user.bets.new( params[:bet] )
    @game = @bet.game
    if @bet.save && @bet.post_on_facebook == '1'
      current_facebook_user.feed_create(
        Mogli::Post.new(:message => t('post_new_bet', :user => current_facebook_user.name, :team_a => t(@game.team_a.country, :scope => 'countries'), :team_b => t(@game.team_b.country, :scope => 'countries'), :team_a_goals => @bet.team_a_goals, :team_b_goals => @bet.team_b_goals))
      )
    end
    Airbrake.notify(:error_class => "InvalidBet", :error_message => "InvalidBet: #{@bet.errors.full_messages.to_sentence}", :parameters => { :errors => @bet.errors.full_messages.to_sentence }) unless @bet.id
    current_user.reload
  end

  def edit
    @bet  = current_user.bets.find( params[:id] )
    @bet.post_on_facebook = false
    @game = @bet.game
  end

  def update
    @bet = current_user.bets.find( params[:id] )
    @bet.update_attributes( params[:bet] )
    @game = @bet.game
    if @bet.errors.empty? && @bet.post_on_facebook == '1'
      current_facebook_user.feed_create(
        Mogli::Post.new(:message => t('post_changed_bet', :user => current_facebook_user.name, :team_a => t(@game.team_a.country, :scope => 'countries'), :team_b => t(@game.team_b.country, :scope => 'countries'), :team_a_goals => @bet.team_a_goals, :team_b_goals => @bet.team_b_goals))
      )
    end
    current_user.reload
  end

  def destroy
    @bet  = current_user.bets.find( params[:id] )
    @game = @bet.game
    @bet.destroy
    current_user.reload
  end

end
