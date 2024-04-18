Rails.application.routes.draw do
  get 'comentarios/index'
  get 'comentarios/show'
  get 'comentarios/new'
  get 'comentarios/create'
  get 'comentarios/edit'
  get 'comentarios/update'
  get 'comentarios/destroy'
  get 'veiculos/index'
  get 'veiculos/show'
  get 'veiculos/new'
  get 'veiculos/create'
  get 'veiculos/edit'
  get 'veiculos/update'
  get 'veiculos/destroy'
  get 'viagens/index'
  get 'viagens/show'
  get 'viagens/new'
  get 'viagens/create'
  get 'viagens/edit'
  get 'viagens/update'
  get 'viagens/destroy'
  get 'usuarios/index'
  get 'usuarios/show'
  get 'usuarios/new'
  get 'usuarios/create'
  get 'usuarios/edit'
  get 'usuarios/update'
  get 'usuarios/destroy'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
