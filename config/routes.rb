# rubocop:disable Layout/SpaceInsideArrayLiteralBrackets, Lint/Syntax
Rails.application.routes.draw do
  root "welcome#index"

  resources :job_applications
  resources :job_offers do
    resources :job_applications, only: [:create, :index, :show, :destroy]
  end

  # Rutas de Devise para usuarios normales (perfil, edición, etc.)
  devise_for :users, controllers: {
    registrations: "users/registrations", # Controlador para usuarios normales
    sessions: "users/sessions"
  }

  resources :users, only: [] do
    member do
      get 'profile', to: 'users#profile'
    end
  end

  # Rutas para el administrador para crear usuarios y gestionar el resto
  devise_scope :user do
    namespace :admin do
      # resources :registrations, only: [:new, :create], controller: "registrations" # Administrador crea usuarios
      # resources :users, only: [:index, :edit, :update, :destroy, :show] do
      #   get "new_application", on: :member
      resources :users, only: [:index, :edit, :update, :destroy, :show]
      get "registrations/new", to: "registrations#new", as: :new_user_registration
      post "registrations", to: "registrations#create", as: :user_registration
      # end
    end
  end

  get "up" => "rails/health#show", as: :rails_health_check
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
end

# rubocop:enable Layout/SpaceInsideArrayLiteralBrackets, Lint/Syntax
