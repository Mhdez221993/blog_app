Rails.application.routes.draw do
  devise_for :users
  root 'users#index'

  resources :users, only: %i[index show] do
    resources :posts, only: %i[index show]
  end
  get 'likes/create'

  resources :posts, only: %i[new create] do
    resources :comments
    resources :likes
  end
end
