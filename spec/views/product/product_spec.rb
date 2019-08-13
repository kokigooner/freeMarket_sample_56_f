require 'rails_helper'

RSpec.feature 'ログインとログアウト' do
  background do
    # ユーザを作成する
    Product.create(id: '2', 
      # user_id:'1',
      product_name:'テストプロダクト',
      price:'100', 
      description:'testtest', 
      # first_category_id:'1',
      # second_category_id:'1',
      # third_category_id:'1',
      # brand_id:'1',
      # size_id:'M',
      condition:'size_id',
      delivery_charge:"送料込み(出品者負担)",
      delivery_date:"1~2日で発送",
      delivery_way:"らくらくメルカリ便",
      # order_id:"1",
      # profit_id:"1",
      # order_status:"1"
    )
  end


    scenario '商品詳細ページ2' do
      visit "products/2"
    end

    scenario '商品詳細ページ1' do
      visit "products/4"
    end



  end









