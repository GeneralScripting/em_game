EmGame::Application.routes.draw do

  root :to => 'login#index'

  resources :bets

end
