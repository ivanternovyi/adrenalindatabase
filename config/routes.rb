Adrenalindatabase::Application.routes.draw do
  devise_for :users

  root :to => "users#index"
  resources :users do
    resources :admin_user_trip_orders
  end
  resources :admin_user_trip_orders do
    resources :admin_trip_order_payments
  end
  resources :towns
  resources :admins
  resources :trips do
    resources :trip_dates
  end
  resources :admin_import_trips do
    post 'upload', on: :collection
  end
  resources :user_trips
  resources :user_trip_orders
end
