Adrenalindatabase::Application.routes.draw do
  devise_for :users

  root :to => "users#index"
  resources :users
  resources :towns
  resources :admins
  resources :trips do
    resources :trip_dates
  end
  resources :user_trips
  resources :user_trip_orders
end
