Rails.application.routes.draw do
  get 'about/index'
  resources :players, only: %i[index show] do
    collection do
      get "search"
    end
  end

  resources :teams, only: %i[index show]
  resources :about, only: %i[index]

  root to: "home#index"

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
