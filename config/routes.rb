Rails.application.routes.draw do
  resources :rooms
  resources :users
  root :to => 'home#index'
  get "/signin" => "users#sign_in"
  post "/user_login" => "users#user_login"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
