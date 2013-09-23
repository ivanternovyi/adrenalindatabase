Adrenalindatabase::Application.routes.draw do

  devise_for :users

  root :to => "users#index"
  resources :users
  resources :towns
  resources :admins
  resources :trips
end
