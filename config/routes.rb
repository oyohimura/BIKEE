Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  resources :bikes do
    resources :rents, only: [:new, :create]
  end
  resources :rents, only: [:index, :show] do
    collection do
      get :owner_rents
    end
  end
  get 'profile/:user_id', to: 'pages#profile'
  get 'dashboard', to: 'pages#dashboard'
  patch 'rents/:id/approve', to: 'rents#approve', as: 'approve_request'
  patch 'rents/:id/reject', to: 'rents#reject', as: 'reject_request'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
