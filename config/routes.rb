Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'users/mypage_profile' => 'users#mypage_profile'
  get "/users/signup" => "users#signup"
  get "users/mypage" => "users#mypage"
end
