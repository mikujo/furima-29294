Rails.application.routes.draw do
  get 'items/new'
  get 'items/create'
  devise_for :users
  resources :item, only: [:new, :create]
end
