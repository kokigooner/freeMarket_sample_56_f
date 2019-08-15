Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, Settings.oauth.twitter.consumer_key, Settings.oauth.facebook.consumer_secret   
  on_failure do |env|
    OmniauthCallbacksController.action(:failure).call(env)
  end 
end