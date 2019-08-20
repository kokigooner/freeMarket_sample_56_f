class UsersController < ApplicationController

  before_action :set_product, only: [:destroy]
  before_action :has_user_params?, only: [:authentication, :address, :payment]
  before_action :set_category_menu, only: [:mypage]


  def new
  end

  def registration
    @user = User.new
    @nickname = session[:nickname]
    @email = session[:email]
    session.delete(:nickname)
    session.delete(:email)
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
      redirect_to new_card_path
    else
      render :address
    end
  end

  def complete
  end

  def login
    @user = User.new
  end

  def profile
  end

  def sell
  end

  def mypage
  end
  
  def myitems
  end

  def myitemdetail
    product_id = Product.find_by_id(params[:id])
    if product_id.present?
      if current_user.id == product_id.user_id
        @product = current_user.products.find_by_id(params[:id])
      else 
        redirect_to users_mypage_path
      end
    else
      redirect_to users_mypage_path
    end
  end

  def mypage_item
  end

  def card
  end

  def card_create
  end

  def identification
  end

  def logout
  end

  def delete
    @product.destoroy
  end

  def updata_address
    if current_user.address.update_attributes(update_address_params)
      redirect_to mypage_identification_path
    else
      redirect_to mypage_identification_path
    end
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
      :prefecture_id,
      :minicipality,
      :address,
      :building,
      :phone_number
    )
  end

  def has_user_params?
    redirect_to users_signup_path unless session[:user_params]
  end

  def set_product
    @product = current_user.product.find(params[:id])
  end

  def update_address_params
    params.require(:address).permit(
      :postal_code,
      :prefecture_id,
      :minicipality,
      :address,
      :building,
    )
  end


end
