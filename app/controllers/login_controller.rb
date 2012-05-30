class LoginController < ApplicationController
  prepend_before_filter :force_user_reload!,          :only => [:index, :log_invitation]
  prepend_before_filter :redirect_unless_in_facebook, :only => [:index]
  before_filter :load_ranking
  
  def index 
    Invitation.save_invitations(current_user, params[:request_ids]) if params[:request_ids]
    @users          = User.order('score DESC').limit(25)
    @games          = Game.pending.order('start_at')
    @current_games  = Game.running.order('start_at')
    @next_game      = @games.first
    @past_games     = Game.ended.order('start_at DESC')
    @bets           = current_user.fetch_bets
  end

  def log_invitation
    params[:invited_users].each do |invited_user_id|
      Invitation.create(:user_id => current_user.id, :request_id => params[:request_id], :guest_id => invited_user_id)
    end
    head :ok
  end
  

  def ranking
    render :partial => 'ranking'
  end


 protected

   def redirect_unless_in_facebook
     redirect_to 'https://apps.facebook.com/em_game/'  if params[:signed_request].nil?
   end

  def load_ranking
    @users = User.order('score DESC').limit(25)
  end

end
