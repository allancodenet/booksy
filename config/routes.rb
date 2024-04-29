Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  scope :api do
    resources :books
    resources :authors
    resources :publishers
    get "/search/:text", to: "search#index"
  end
  root to: "books#index"
end
