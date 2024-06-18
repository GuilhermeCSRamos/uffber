Rails.application.routes.draw do
  resources :comments
  resources :lifts, only: %i[show create update] do
    post :finish, on: :member
    post :cancel, on: :member
    collection do
      get :driver_index
      get :passenger_index
    end
  end

  resources :vehicles, only: %i[show create update destroy]
  resources :drivers, except: %i[index show create update destroy] do
    get :actual_lift
  end
  resources :passengers, except: %i[index show create update destroy] do
    get :actual_lift
  end
  resources :users, only: %i[show create update destroy] do
    get :history
  end
  resources :logins, only: :create

  # match '/lifts', controller: 'lifts', action: 'cors_preflight_check', via: [:options]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "lifts#index"
end
