Adrenalindatabase::Application.routes.draw do

  get "trip_dates/new"

  get "trip_dates/edit"

  get "trip_dates/delete"

  devise_for :users

  root :to => "users#index"
  resources :users
  resources :towns
  resources :admins
  resources :trips do
    resources :trip_dates
  end
end
