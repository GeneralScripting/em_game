EmGame::Application.routes.draw do

  root :to => 'login#index'

  get :please_login, :to => 'login#please_login'

  post :log_invitation, :to => 'login#log_invitation'

  resources :bets

  get :ranking, :to => 'login#ranking'

  match ':page',  :as => :page, :to => 'pages#show',  :constraints =>  {:page => /[a-z]\w*/ }

end
