Rails.application.routes.draw do

  root 'home#index'

  devise_for :users, controllers: {registrations: "users_devise/registrations", omniauth_callbacks: :callbacks}
  #devise_for :users, controllers: {omniauth_callbacks: :callbacks}
  resources :posts
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :posts do
    resources :votes, only: [:create, :destroy]
    resources :comments, only: [:create, :destroy]
  end
  resources :users, only: :show
  resources :notifications, only: [:index, :show]

  get "tags/:tag", to: "posts#index", as: :tag
  get "/chatwork", to: "chatwork#index"
  post "/chatwork", to: "chatwork#send_message"

end
