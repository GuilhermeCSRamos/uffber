Rails.application.routes.draw do
  resources :comments
  resources :lifts, only: %i[index show create update] do
    post :finish, on: :member
    post :cancel, on: :member
  end
  resources :vehicles
  resources :drivers, only: %i[index show create update destroy]
  resources :passengers
  resources :users

  # match '/lifts', controller: 'lifts', action: 'cors_preflight_check', via: [:options]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  root "lifts#index"
end
