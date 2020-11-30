Rails.application.routes.draw do
  devise_for :users
  get 'prototypes/index'
  get 'mailers/index'
  resources :prototypes do
    resources :comments, only: :create
    end

  resources :users, only: :show
  
  root to: "prototypes#index"
  resources :prototypes, only: [:index, :new, :create, :show, :edit, :update, :destroy]
end
