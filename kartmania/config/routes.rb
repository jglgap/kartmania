Rails.application.routes.draw do

  devise_for :clientes
  devise_for :users

  resources :clientes, path: 'gestion_clientes' do

    member do
      get :datos
      get :edit_cliente, to: 'clientes#edit_cliente'
      patch :update_cliente, to: 'clientes#update_cliente'
      get :show_cliente, to: 'clientes#show_cliente'
    end
  end
  resources :users, path: 'usuarios' 

  resources :circuitos
  resources :karts
  resources :planes do
    collection do
      get :index_cliente
    end
    member do
      get  :reservar , to: 'reservas#reservar'      # Formulario de reserva pública
      post :crear_reserva , to: 'reservas#crear_reserva'  # Crea la reserva pública
    end
  end

  resources :torneos do
    collection do
      get :index_cliente    # Vista de cards para clientes
    end
    member do
      post   :participar    # Cliente se apunta al torneo
      delete :no_participar # Cliente se da de baja del torneo
    end
  end
  resources :participantes
  resources :reservas do
    collection do
      get  :new_segundopaso
      post :create_segundopaso
      get  :show_cliente
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
  get '/auth/google_oauth2/callback', to: 'google_calendar#callback'
  get '/auth/failure', to: 'google_calendar#failure'
  root "landing#welcome"
  
end
