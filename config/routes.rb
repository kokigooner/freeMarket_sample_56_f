Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "products#toppage"

  get '/products', to: 'products#toppage'
  get "/products/confirm", to: "products#confirm"
  get "/products/sell", to: "products#sell"

  resources :products, only: [:show]
 
  get '/users/mypage/profile', to: 'users#profile'
  get "/users/mypage", to: "users#mypage"
  get "/users/mypage/myitems", to: "users#myitems"
  get "/users/mypage/myitem/:id", to: "users#myitemdetail",as: :users_mypage_myitem
  delete "/users/mypage/myitem/:id", to: "products#delete"
  get "/mypage/identification", to: "users#identification" 
  post "/mypage/identification", to: "users#updata_address" 
  get "/mypage/logout", to: "users#logout"
  
  get "/users/signup/registration", to: "users#registration"
  post "/users/signup/confirmation", to: "users#confirmation"
  get "/users/signup/authentication", to: "users#authentication"
  get "/users/signup/address", to: "users#address"
  post "/users/signup/payment", to: "users#payment"
  get "/users/signup/complete", to: "users#complete"
  get "/users/mypage/item", to: "users#mypage_item"

  resources :cards, only: [:show, :new, :create, :destroy] do
    collection do
      get 'add'
    end
  end

  resources :users, only: [:new]

  get "/users/sell", to: "users#sell"
  get "/users/login", to: "users#login"
  get '/users/sign_out', to: 'devise/sessions#destroy'
end
