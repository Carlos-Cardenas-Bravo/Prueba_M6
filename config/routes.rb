# rubocop:disable Layout/SpaceInsideArrayLiteralBrackets, Lint/Syntax
Rails.application.routes.draw do
  root "welcome#index"

  resources :job_applications
  resources :job_offers do
    resources :job_applications, only: [:create, :index, :show, :destroy]
  end

  devise_for :users, controllers: {
    # registrations: "devise/registrations",
    sessions: "users/sessions",
    registrations: "users/registrations"  # Usar el controlador personalizado para registros
  }

  namespace :admin do
    resources :users, only: [:index, :edit, :update, :destroy, :show] do
      get "new_application", on: :member
    end
  end

  get "up" => "rails/health#show", as: :rails_health_check
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
end

# rubocop:enable Layout/SpaceInsideArrayLiteralBrackets, Lint/Syntax
