Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  root "boards#home"
  get '/home', to: 'boards#home'
  get '/table', to: 'static_pages#table'

  resources :boards do
    resources :states
  end

  resources :users
  resources :tasks
  resources :labels

  resources :states do
    resources :tasks
  end

  resources :teams

end
