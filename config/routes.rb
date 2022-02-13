Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  devise_for :users,
             controllers: {
                 sessions: 'users/sessions',
                 registrations: 'users/registrations'
             }
  get '/member-data', to: 'members#show'

  root 'users#index'

  resources :users, only: %i[index show] do
    resources :posts, only: %i[index show destroy]
  end
  get 'likes/create'

  resources :posts, only: %i[new create index] do
    resources :comments, only: %i[new create destroy index]
    resources :likes, only: %i[new create]
  end
end
