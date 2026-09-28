Rails.application.routes.draw do

  get "up" => "rails/health#show", as: :rails_health_check

  scope :api do
    scope :v1 do
      resources :interaction_reviews
      resources :book_reviews
      resources :reviews
      resources :reaction_comments
      resources :comments
      resources :users
    end
  end

  # Defines the root path route ("/")
  # root "posts#index"
end
