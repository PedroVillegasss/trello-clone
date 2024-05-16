Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  root "boards#home"
  get '/home', to: 'boards#home'
  get '/table', to: 'static_pages#table'

  resources :boards
  resources :users
  resources :tasks  # TO DO > Task creation with the 'Add a task' button in the board/show page
  resources :labels  # TO DO > Label creation with the 'Add a label' button in the dropdown menu of the board/show page
  resources :states  # TO DO > State creation with the 'Add a state' button in the dropdown menu of the board/show page

end
