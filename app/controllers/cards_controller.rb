class CardsController < ApplicationController
  require "payjp"
  
  def new
  end

  def add
  end

  def show
    @cards = current_user.cards
  end

  def create
    if params["payjpToken"].blank?
      user_signed_in? ? (render :add) : (render :new)
    end

    Payjp.api_key = Rails.application.secrets.payjp_secret_key
    customer = Payjp::Customer.create(card: params["payjpToken"])

    recreate(customer) if user_signed_in?

    @user = User.new(session[:user_params])
    @address = Address.new(session[:address_params].merge(user: @user))
    @card = Card.new(
      customer: customer.id,
      card: customer.default_card,
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

  def recreate(customer)
    card = Card.new(
      customer: customer.id,
      card: customer.default_card,
      user: current_user
    )

    if card.save
      redirect_to card_path(current_user)
    else
      render :add
    end
  end

end
