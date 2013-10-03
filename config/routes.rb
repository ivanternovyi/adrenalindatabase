Adrenalindatabase::Application.routes.draw do
  devise_for :users

  resources :admin_user_trip_orders
  root :to => "users#index"
  resources :users do
    resources :admin_user_trip_orders
  end
  resources :towns
  resources :admins
  resources :trips do
    resources :trip_dates
  end
  resources :user_trips
  resources :user_trip_orders
end
