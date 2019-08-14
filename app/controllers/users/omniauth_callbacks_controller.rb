class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def facebook
    callback_from :facebook
  end

  def google_oauth2
    callback_from :google
  end

  private

  def callback_from(provider)
    provider = provider.to_s
    @user = User.find_for_oauth(request.env['omniauth.auth'])
    uid = request.env['omniauth.auth'][:uid]
    sns_credential = SnsCredential.find_by(uid: uid)
    
    if sns_credential.present?
      flash[:notice] = I18n.t('devise.omniauth_callbacks.success', kind: provider.capitalize)
      @user = sns_credential.user
      sign_in(@user)
      redirect_to root_path
    else
      session[:uid] = request.env['omniauth.auth'][:uid]
      session[:provider] = provider
      session[:nickname] = request.env['omniauth.auth']["info"][:name]
      session[:email] = request.env['omniauth.auth']["info"][:email]
      redirect_to users_signup_registration_path
    end
  end
end
