Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "products#toppage"
  get '/products' => 'products#toppage'
  get "/products/:id" => "products#products_detail" 
  get "/products/confirm" => "products#confirm"
  get "/products/sell" => "products#sell"
  get '/users/mypage/profile' => 'users#profile'
  get '/users/mypage/card' => "users#card"
  get '/users/mypage/card/create' => "users#card_create"
  get "/users/mypage" => "users#mypage"
  get "/mypage/identification" => "users#identification" 
  get "/mypage/logout" => "users#logout"
  
  get "/users/signup" => "users#signup"
  post "/users/signup" => "users#create"
  get "/users/signup/registration" => "users#registration"
  post "/users/signup/confirmation" => "users#confirmation"
  get "/users/signup/authentication" => "users#authentication"
  get "/users/signup/address" => "users#address"
  post "/users/signup/payment" => "users#payment"
  get "/users/signup/complete" => "users#complete"

  get "/users/sell" => "users#sell"
  get "/users/login" => "users#login"
  get '/users/sign_out' => 'devise/sessions#destroy'
end
