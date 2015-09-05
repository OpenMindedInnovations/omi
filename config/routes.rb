OMI::Application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations' }

  get 'auth/:provider/callback', to: 'authentications#create'
  get 'signout', to: 'authentications#destroy', as: :logout
  get '/auth/google_oauth2', as: 'login'

  get 'about', to: 'pages#about', as: :about
  get 'admin', to: 'pages#admin', as: :admin
  get 'dashboard', to: 'pages#dashboard', as: :dashboard

  root "pages#home"

  resources :blogs do
    collection do
      get 'tags/*tags', to: 'blogs#index', as: :tag
    end
  end

  resources :projects do
    collection do
      get 'tags/*tags', to: 'projects#index', as: :tag
    end
    member do
      put :toggle_favorite
    end
  end

  resources :ideas do
    collection do
      get 'tags/*tags', to: 'ideas#index', as: :tag
    end
    member do
      put :toggle_vote
    end
  end

  get 'work', to: 'projects#work', as: :work
  get 'work/:id', to: 'projects#work_show', as: :work_show
  get 'products', to: 'projects#products', as: :products
  get 'products/:id', to: 'projects#products_show', as: :products_show

  resources :users, only: [:index, :show]

  namespace :api, defaults: {format: 'json'} do
    namespace :v1 do
      namespace :tags do
        get '/search' => '/api/v1/tags#search'
      end
    end
  end
end
