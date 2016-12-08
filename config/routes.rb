;Rails.application.routes.draw do

  root 'static_pages#home'
  get '/about', to: 'static_pages#about'
  get '/signup', to: 'users#new'
  post '/signup',  to: 'users#create'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  get '/search', to: 'static_pages#home'

  get 'contact', to: 'messages#new', as: 'contact'
  post 'contact', to: 'messages#create'

  resources :users do
    member do
      get :following, :followers
    end
  end

  resources :users do
    member do
      get :attending
    end
  end

  resources :microposts do
    member do
      get :attendee
    end
  end

  resources :microposts, only: [:create, :edit, :update, :destroy]
  resources :relationships,       only: [:create, :destroy]
  resources :attends, only: [:create, :destroy]

end
