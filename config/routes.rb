Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: :registrations,
    sessions: :sessions
  }

  root "home#index"
  resources :movies, only: [:index]
  get "/share", to: "movies#share"
  post "/share", to: "movies#create"
end
