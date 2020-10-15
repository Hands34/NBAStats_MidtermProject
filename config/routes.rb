Rails.application.routes.draw do
  get 'home/index'
  resources :players, only: %i[index show]
  resources :teams, only: %i[index show]

  # get 'teams/index'
  # get 'teams/show'
  # get 'players/index'
  # get 'players/show'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
