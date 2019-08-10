Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "products#toppage"
  get '/products' => 'products#toppage'
  get "/products/detail" => "products#products_detail" 
  get "/products/confirm" => "products#confirm"

  get '/users/mypage/profile' => 'users#profile'
  get '/users/mypage/card' => "users#card"
  get '/users/mypage/card/create' => "users#card_create"
  get "/users/mypage" => "users#mypage"
  get "/mypage/identification" => "users#identification" 
  get "/mypage/logout" => "users#logout"
  
  get "/users/signup" => "users#signup"
  get "/users/signup/registration" => "users#registration"
  get "/users/signup/confirmation" => "users#confirmation"
  get "/users/signup/authentication" => "users#authentication" 
  get "/users/sell" => "users#sell"
  get "/users/signup/address" => "users#address" 
  get "/users/signup/payment" => "users#payment" 
  get "/users/signup/complete" => "users#complete"
  get "/users/login" => "users#login"

end
