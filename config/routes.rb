Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check

  namespace :api, format: :json do
    namespace :v1 do
      resources :reviews do
        resources :book_reviews
        resources :interaction_reviews
        resources :comments
        resources :reaction_comments
      end

      resources :users, only: [ :index, :show, :update, :destroy ] do
        get :me, on: :collection
      end

      resources :dashboards, only: [ :index ]
    end
  end

  # Defines the root path route ("/")
  # root "posts#index"
end
