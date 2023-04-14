Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: :registrations,
    sessions: :sessions
  }

  root "home#index"
  get "/share", to: "movies#share"
  post "/share", to: "movies#create"

  namespace :api, defaults: { format: :json } do
    resources :movies, only: [] do
      member do
        post :like
        post :dislike
      end
    end
  end
end
