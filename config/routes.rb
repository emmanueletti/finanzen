Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "home#index"

  namespace :admin do
    resources :wealth, only: [:index]
    resources :assets, except: [:show]
  end
end
