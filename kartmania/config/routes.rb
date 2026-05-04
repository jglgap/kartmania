Rails.application.routes.draw do

  devise_for :clientes
  devise_for :users

  resources :clientes, path: 'gestion_clientes' do
    member do
      get :datos
    end
  end
  resources :users, path: 'usuarios' 

  resources :circuitos
  resources :karts
  resources :planes
  resources :torneos
  resources :participantes
  resources :reservas do
    collection do
      get  :new_segundopaso
      post :create_segundopaso
    end
    member do
      get   :edit_clientes
      patch :update_clientes
    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
  get "welcome", to: "landing#welcome"
  get "our_karts", to: "landing#our_karts"
  root "landing#welcome"
  
end
