Rails.application.routes.draw do
  resources :rooms
  resources :users
  root :to => 'home#index'
  get "/signin" => "users#sign_in", as: :sign_in
  post "/user_login" => "users#user_login"
  get "/join_room" => "rooms#join_room", as: :join_room

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
