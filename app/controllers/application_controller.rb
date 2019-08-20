class ApplicationController < ActionController::Base
  before_action :basic_auth, if: :production?
  before_action :search_set
  protect_from_forgery with: :exception

  private

  def production?
    Rails.env.production?
  end

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV["BASIC_AUTH_USER"] && password == ENV["BASIC_AUTH_PASSWORD"]
    end
  end

  def set_category_menu
    @categories = FirstCategory.all.includes(
      :second_categories, {
        second_categories: :third_categories
      }
    )
  end

  def search_set
  @s = params[:q]
    if @s != nil
      params[:q]['product_name_cont_all'] = params[:q]['product_name_cont_all'].split(/[\p{blank}\s]+/)
    end
    @q = Product.ransack(params[:q])
    @s_products = @q.result
  end
end
