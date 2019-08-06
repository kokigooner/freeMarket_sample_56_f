Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get 'products' => 'products#toppage'
  get 'users/mypage_profile' => 'users#mypage_profile'
  get "/users/signup" => "users#signup"
  get "/users/signup/registration" => "users#registration"
  get "/users/signup/sms_confirmation" => "users#sms_confirmation"
  get "/users/signup/sms_authentication" => "users#sms_authentication" 
  get "/users/signup/address" => "users#address" 
  get "/users/signup/payment" => "users#payment" 
  get "/users/signup/complete" => "users#complete" 
  get "/mypage/identification/"=> "users#identification" 
end
