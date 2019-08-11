class UsersController < ApplicationController

  def signup
  end

  def registration
    @user = User.new
  end

  def confirmation
    session[:nickname] = user_params[:nickname]
    session[:email] = user_params[:email]
    session[:password] = user_params[:password]
    session[:password_confirmation] = user_params[:password_confirmation]
    session[:family_name] = user_params[:family_name]
    session[:first_name] = user_params[:first_name]
    session[:family_name_kana] = user_params[:family_name_kana]
    session[:first_name_kana] = user_params[:first_name_kana]
    session[:birth_year] = user_params[:birth_year]
    session[:birth_month] = user_params[:birth_month]
    session[:birth_day] = user_params[:birth_day]

    @user = User.new(
      nickname: session[:nickname],
      email: session[:email],
      password: session[:password],
      family_name: session[:family_name],
      first_name: session[:first_name],
      family_name_kana: session[:family_name_kana],
      first_name_kana: session[:first_name_kana],
      birth_year: session[:birth_year],
      birth_month: session[:birth_month],
      birth_day: session[:birth_day]
    )
    render :registration if @user.invalid?
  end

  def authentication
  end

  def address
    @address = Address.new
    @family_name = session[:family_name]
    @first_name = session[:first_name]
    @family_name_kana = session[:family_name_kana]
    @first_name_kana = session[:first_name_kana]
  end

  def payment
    session[:family_name] = address_params[:family_name]
    session[:first_name] = address_params[:first_name]
    session[:family_name_kana] = address_params[:family_name_kana]
    session[:first_name_kana] = address_params[:first_name_kana]
    session[:postal_code] = address_params[:postal_code]
    session[:prefecture] = address_params[:prefecture]
    session[:minicipality] = address_params[:minicipality]
    session[:address] = address_params[:address]
    session[:building] = address_params[:building]
    session[:phone_number] = address_params[:phone_number]

    address = Address.new(
      family_name: session[:family_name],
      first_name: session[:first_name],
      family_name_kana: session[:family_name_kana],
      first_name_kana: session[:first_name_kana],
      postal_code: session[:postal_code],
      prefecture: session[:prefecture],
      minicipality: session[:minicipality],
      address: session[:address],
      building: session[:building],
      phone_number: session[:phone_number]
    )
    render :address if address.invalid?
  end

  def create
    @user = User.new(
      nickname: session[:nickname],
      email: session[:email],
      password: session[:password],
      password_confirmation: session[:password_confirmation],
      family_name: session[:family_name],
      first_name: session[:first_name],
      family_name_kana: session[:family_name_kana],
      first_name_kana: session[:first_name_kana],
      birth_year: session[:birth_year],
      birth_month: session[:birth_month],
      birth_day: session[:birth_day]
    )
    @user.address = Address.new(
      family_name: session[:family_name],
      first_name: session[:first_name],
      family_name_kana: session[:family_name_kana],
      first_name_kana: session[:first_name_kana],
      postal_code: session[:postal_code],
      prefecture: session[:prefecture],
      minicipality: session[:minicipality],
      address: session[:address],
      building: session[:building],
      phone_number: session[:phone_number],
      user_id: @user.id
    )
    if @user.save && @user.address.save
      session[:id] = @user.id
      redirect_to users_signup_complete_path
    else
      render users_signup_payment_path
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

  def card
  end

  def card_create
  end

  def identification
    @test_model = {name:"山田太郎",kana_name:"ヤマダ　タロウ",birthday:"2000年01日01日"}
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

end
