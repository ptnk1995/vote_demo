Rails.application.routes.draw do
  root 'home#index'

  devise_for :users, controllers: {registrations: "users_devise/registrations"}
  resources :posts
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :posts do
    resources :votes, only: [:create, :destroy]
  end
  resources :users, only: :show


  get "tags/:tag", to: "posts#index", as: :tag
end
