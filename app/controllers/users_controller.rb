class UsersController < ApplicationController
  before_action :has_user_params?, only: [:authentication, :address, :payment]
  before_action :set_user, only: [:mypage, :edit, :update, :destroy]
  
  def signup
  end

  def registration
    @user = User.new
  end

  def confirmation
    @user = User.new(user_params)
    if @user.valid?
      session[:user_params] = user_params
    else
      render :registration
    end
  end

  def authentication
  end

  def address
    @address = Address.new
    @family_name = session[:user_params]["family_name"]
    @first_name = session[:user_params]["first_name"]
    @family_name_kana = session[:user_params]["family_name_kana"]
    @first_name_kana = session[:user_params]["first_name_kana"]
  end

  def payment
    @user = User.new(session[:user_params])
    @address = Address.new(address_params.merge(user: @user))
    if @address.valid?
      session[:address_params] = address_params
    else
      render :address
    end
  end

  def create
    @user = User.new(session[:user_params])
    @address = Address.new(session[:address_params].merge(user: @user))
    if @user.save && @address.save  
      reset_session
      sign_in(@user)
      redirect_to users_signup_complete_path
    else
      render :payment
    end
  end

  def complete
  end

  def login
  end

  def profile
  end

  def sell
  end

  def mypage

  end
  
  def mypage_task
    
  end

  def card
  end

  def card_create
  end

  def identification
    @test_model = { name: "山田太郎", kana_name: "ヤマダ タロウ", birthday: "2000年01日01日" }
  end

  def logout
  end

  private
  def user_params
  params.require(:user).permit(
    :nickname,
    :email,
    :password,
    :password_confirmation,
    :family_name,
    :first_name,
    :family_name_kana,
    :first_name_kana,
    :birth_year,
    :birth_month,
    :birth_day
  )
  end

  def address_params
    params.require(:address).permit(
      :family_name,
      :first_name,
      :family_name_kana,
      :first_name_kana,
      :postal_code,
      :prefecture,
      :minicipality,
      :address,
      :building,
      :phone_number
    )
  end

  def has_user_params?
    redirect_to users_signup_path unless session[:user_params]
  end

  def set_user
    @user = User.find(params[:id])
  end

end
