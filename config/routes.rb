Rails.application.routes.draw do
  devise_for :users

  devise_scope :user do
    authenticated :user do
      get "restaurants/index" => "restaurants#index"
      # go to user show page upon sign in
      root 'users#show', as: :authenticated_root

    end

    unauthenticated do
      # login page if not signed in
      root 'devise/registrations#new', as: :unauthenticated_root
    end
  end

  resources :users, only: [] do
    resources :restaurants
  end
end
