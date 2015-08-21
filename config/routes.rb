Omi1::Application.routes.draw do
  get 'auth/:provider/callback', to: 'authentications#create'
  get 'signout', to: 'authentications#destroy', as: :logout
  get '/auth/google_oauth2', as: 'login'

  get 'about', to: 'pages#about', as: :about
  get 'admin', to: 'pages#admin', as: :admin

  get 'tags/:tag', to: 'blogs#index', as: :tag

  resources :authentications, only: [:create, :destroy]
  resources :blogs
  resources :projects

  root "blogs#index"
end
