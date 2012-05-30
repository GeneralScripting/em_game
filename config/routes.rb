EmGame::Application.routes.draw do

  root :to => 'login#index'

  post :log_invitation, :to => 'login#log_invitation'

  resources :bets
  match ':page',  :as => :page, :to => 'pages#show',  :constraints =>  {:page => /[a-z]\w*/ }

end
