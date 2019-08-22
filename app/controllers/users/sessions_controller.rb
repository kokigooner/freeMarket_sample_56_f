class Users::SessionsController < Devise::SessionsController
  before_action :verify_user, only: [:create]
  before_action :configure_sign_in_params, only: [:create]

  def new
    super
  end

  def create
    super
  end

  def destroy
    super
  end

  protected

  def configure_sign_in_params
    devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  end

  def verify_user
    unless verify_recaptcha(model: @user)
      @user = User.new(email: params["user"][:email])
      @user.errors.add(:base, :unverified)
      render :new
    end
  end
end
