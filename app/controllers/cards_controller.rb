class CardsController < ApplicationController
  require "payjp"
  
  def new
  end

  def create
    Payjp.api_key = Rails.application.secrets.payjp_secret_key
    
    if params["payjpToken"].blank?
      render :new
    else
      @customer = Payjp::Customer.create(card: params["payjpToken"])
    end

    @user = User.new(session[:user_params])
    @address = Address.new(session[:address_params].merge(user: @user))
    @card = Card.new(
      customer_id: @customer.id,
      card_id: @customer.default_card,
      user: @user
      )

    if session[:provider]
      @user.sns_credentials.new(
        provider: session[:provider],
        uid: session[:uid]
      )
    end

    if @user.save && @address.save && @card.save
      reset_session
      sign_in(@user)
      redirect_to users_signup_complete_path
    else
      render :new
    end
  end

end
