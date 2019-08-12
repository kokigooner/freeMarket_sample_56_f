class UsersController < ApplicationController
  before_action :set_user, only: [:mypage, :edit, :update, :destroy]
  def signup
  end

  def login
  end

  def registration
  end

  def confirmation
  end

  def authentication
  end

  def address
  end

  def payment
  end

  def complete
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
    @test_model = {name:"山田太郎",kana_name:"ヤマダ　タロウ",birthday:"2000年01日01日"}
  end

  def logout
  end

  def set_user
    @user = User.find(params[:id])
  end



end
