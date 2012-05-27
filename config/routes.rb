EmGame::Application.routes.draw do

  root :to => 'login#index'

  resources :bets

  match ':page',  :as => :page, :to => 'pages#show',  :constraints =>  {:page => /[a-z]\w*/ }

end
