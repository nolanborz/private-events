Rails.application.routes.draw do
  devise_for :users
  resources :events do
    member do
      post "attend" => "event_attendances#create"
      delete "attend" => "event_attendances#destroy"
    end
  end
  resources :users, only: [ :show ]
  root "events#index"

  get "up" => "rails/health#show", as: :rails_health_check
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
end
