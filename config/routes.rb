Rails.application.routes.draw do
  get "home/index"
  get "teams/index"
  get "teams/show"
  get "seasons/index"
  get "seasons/show"
  get "leagues/index"
  get "leagues/show"
  root "home#index"  # Set the root route
  resources :leagues, only: [ :index, :show ] do
    resources :seasons, only: [ :show ] do
      resources :matches, only: [ :index, :show ]
    end
  end
  resources :teams, only: [ :index, :show ]


  get "/search", to: "matches#search", as: "search_matches"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/*
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  # Defines the root path route ("/")
  # root "posts#index"
end
