EmGame::Application.routes.draw do

  root :to => 'login#index'

  get :please_login, :to => 'login#please_login'

  post :log_invitation, :to => 'login#log_invitation'

  resources :bets
  resources :chat_messages, :only => [:create]

  get :pending_games, :to => 'login#pending_games'
  get :current_games, :to => 'login#current_games'
  get :next_game, :to => 'login#next_game'
  get :past_games, :to => 'login#past_games'
  get :ranking, :to => 'login#ranking'

  match ':page',  :as => :page, :to => 'pages#show',  :constraints =>  {:page => /[a-z]\w*/ }

end
