Rails.application.routes.draw do
  
 root   'home#index'
  get 'items/download/:id' => 'items#download'
  get 'likes/create'
  get 'likes/destroy'
  get    '/list' => 'home#list'
  get    '/help',    to: 'home#help'
  get    '/about',   to: 'home#about'
  get    '/contact', to: 'home#contact'
  get    '/signup',  to: 'users#new'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  get   '/microposts/:id' => 'microposts#destroy'
  resources :likes, only: [:create, :destroy]
  resources :users do
    member do
      get :following, :followers
    end
  end
  resources :microposts,          only: [:create, :destroy]
  resources :relationships,       only: [:create, :destroy]
  resources :quizzes
  resources :rankings
  resources :items
  get 'rooms/show'
  
  mount ActionCable.server => '/cable'
  
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
