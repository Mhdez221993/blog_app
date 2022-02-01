Rails.application.routes.draw do
  devise_for :users
  get 'likes/create'
  root 'users#index'
  resources :users, only: %i[index show] do
    resources :posts, only: %i[index show]
  end

  resources :posts, only: %i[new create] do
    resources :comments
    resources :likes
  end
end
