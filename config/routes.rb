Rails.application.routes.draw do
  root 'static_pages#home'

  get 'password_resets/new'
  get 'password_resets/edit'
  get  '/help',      to: 'static_pages#help'
  get  '/about',     to: 'static_pages#about'
  get  '/contact',   to: 'static_pages#contact'
  get  '/signup',    to: 'users#new'
  post '/signup',    to: 'users#create'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  resources :users do
    member do
      get :following, :followers
    end
  end
  resources :account_activations, only: [:edit]
  resources :password_resets, only: [:new, :create, :edit, :update]
  resources :microposts, only: [:create, :destroy]
  resources :relationships, only: [:create, :destroy]

  # ユーザ情報API用のエンドポイントを定義
  scope '/api', { format: 'json' } do
    resources :users do
      member do
        get :user_info, to: 'users#user_info'
      end
    end
  end
end
