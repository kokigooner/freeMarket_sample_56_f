Rails.application.routes.draw do
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    sessions: 'users/sessions'
  }
  root to: "products#index"

  get "/products/sell", to: "products#new"
  get "/products/edit", to: "products#edit"
  

  match 'secondcategory', to: 'products#secondcategory', via: [:get, :post]
  match 'thirdcategory', to: 'products#thirdcategory', via: [:get, :post]

  get '/products/search', to: 'products#search'

  resources :products, only: [:index, :show, :update, :create] do
    member do
      get 'confirm'
      post 'purchase'
      get 'complete'
    end
  end

  resources :products, only: [:show] do
    resources :likes, only: [:create, :destroy]
  end

  resources :categories, only: [] do
    member do
      get 'first'
      get 'second'
      get 'third'
    end
  end


  
  get '/users/mypage/profile', to: 'users#profile'
  get "/users/mypage", to: "users#mypage"
  get "/users/mypage/myitems", to: "users#myitems"
  get "/users/mypage/myitem/:id", to: "users#myitemdetail",as: :users_mypage_myitem
  delete "/users/mypage/myitem/:id", to: "products#destroy"
  get "/mypage/identification", to: "users#identification" 
  post "/mypage/identification", to: "users#update_address" 
  get "/mypage/logout", to: "users#logout"
  
  get "/users/signup/registration", to: "users#registration"
  post "users/signup/confirm", to: "users#confirm_user" 
  get "/users/signup/confirmation", to: "users#confirmation"
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
end
