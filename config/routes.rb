Rails.application.routes.draw do
  resources :players, only: %i[index show]
  resources :teams, only: %i[index show]

  root to: "home#index"

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
