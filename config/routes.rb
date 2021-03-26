Rails.application.routes.draw do
  devise_for :users
  root to: 'homes#top'
  get 'home/about' => 'homes#about'
  resources :users, only: [:new, :index, :create, :show, :destroy, :edit, :create, :update]
  resources :books, only: [:new, :index, :create, :show, :destroy, :edit, :create, :update]

end
