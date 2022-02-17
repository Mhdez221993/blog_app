Rails.application.routes.draw do
  devise_for :users,
             controllers: {
                 sessions: 'users/sessions',
                 registrations: 'users/registrations'
             }

  root 'users#index'

  resources :users, only: %i[index show] do
    resources :posts, only: %i[index show destroy]
  end
  get 'likes/create'

  resources :posts, only: %i[new create index] do
    resources :comments, only: %i[index new create destroy]
    resources :likes, only: %i[new create]
  end
end
