Adrenalindatabase::Application.routes.draw do
  devise_for :users

  root :to => "users#index"
  resources :users do
    resources :admin_user_trip_orders
  end
  resources :admin_user_trip_orders
  resources :admin_payment_trip_orders
  resources :towns
  resources :admins
  resources :trips do
    resources :trip_dates
  end
  resources :user_trips
  resources :user_trip_orders
end
