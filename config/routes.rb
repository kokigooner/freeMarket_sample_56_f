Rails.application.routes.draw do
  get "/users/signup" => "users#signup"
  get "/users/signup/registration" => "users#registration"
end
