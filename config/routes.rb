OMI::Application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations' }

  get 'auth/:provider/callback', to: 'authentications#create'
  get 'signout', to: 'authentications#destroy', as: :logout
  get '/auth/google_oauth2', as: 'login'

  get 'about', to: 'pages#about', as: :about
  get 'admin', to: 'pages#admin', as: :admin
  get 'dashboard', to: 'pages#dashboard', as: :dashboard

  root "pages#home"

  get 'tags/:tag', to: 'blogs#index', as: :tag

  resources :blogs
  resources :projects
  resources :ideas

  get 'work', to: 'projects#work', as: :work
  get 'products', to: 'projects#products', as: :products

  resources :users, only: [:index]

end
