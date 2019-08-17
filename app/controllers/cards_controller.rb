class CardsController < ApplicationController
  before_action :confirm_user, only: [:add, :show, :remake, :destroy]

  require "payjp"
  Payjp.api_key = 'sk_test_75a3bf2aaa150915275ad5cd'
  
  def new
  end

  def add
  end

  def show
    @cards = Array.new
    users_cards = current_user.cards
    users_cards.each do |card|
      customer = Payjp::Customer.retrieve(card.customer)
      @cards << customer.cards.retrieve(card.card)
    end
  end

  def create
    if params["payjpToken"].blank?
      user_signed_in? ? (render :add) : (render :new)
    end

    customer = Payjp::Customer.create(card: params["payjpToken"])

    if user_signed_in?
      recreate(customer)
    else
      create_new(customer)
    end
  end

  def make(customer)

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

  def create_new(customer)
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

  def destroy
    card = Card.find_by(user_id: params[:id])
    customer = Payjp::Customer.retrieve(card.customer)
    card_payjp = customer.cards.retrieve(card.card)
    response = card_payjp.delete
    if response["deleted"]
      card.destroy
      redirect_to card_path(current_user)
    end
  end

  private
  def confirm_user
    redirect_to users_login_path unless user_signed_in?
  end

end
