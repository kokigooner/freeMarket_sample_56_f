# README

本アプリにおけるDB設計内容を下記に示す。

## usersテーブル

|Column|Type|Options|
|------|----|-------|
|nickname|string|null:false,unique|
|email_address|string|null:false,unique|
|password|string|null:false|
|family_name|string|null:false|
|first_name|string|null:false|
|family_name_kana|string|null:false|
|first_name_kana|string|null:false|
|birthday_year|integer|null:false|
|birthday_month|integer|null:false|
|birthday_day|integer|null:false|
|phone_number|integer|null:false,unique|
|introduction|text||

* has_many :products, dependent: :destroy
* has_many :orders
* has_many :profits, dependent: :destroy
* has_many :points
* has_many :product_purchase_messages
* has_many :likes
* has_many :points, dependent: :destroy
* has_many :payments, dependent: :destroy
* has_many :comments
* has_many :ratings
* has_many :evalution, dependent: :destroy
* has_one :address

## adressesテーブル
|Column|Type|Options|
|------|----|-------|
|postal_code|integer|null:false|
|minicipality|string|null:false|
|address|string|null:false|
|building|string||

belongs_to :user

## productsテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|reference|foreign_key:true|
|product_name|string|null:false|
|price|integer|null:false|
|description|text|null:false|
|first_category_id|reference|foreign_key:true|
|second_category_id|reference|foreign_key:true|
|third_category_id|reference|foreign_key:true|
|brand_id|reference|foreign_key:true|
|size_id|reference|foreign_key:true|
|condition|string|null:false|
|delivery_charge|string|null:false|
|delivery_date|string|null:false|
|delivery_way|string|null:false|
|order_id|reference|foreign_key:true|
|profit_id|reference|foreign_key:true|
|order_status|text||

* has_many :images, dependent: :destroy
* has_many :product_purchase_messages, dependent: :destroy
* has_many :likes, dependent: :destroy
* has_many :ratings, dependent: :destroy
* has_one :profit
* belongs_to :order
* belongs_to :user
* belongs_to :first_category
* belongs_to :second_category
* belongs_to :third_category
* belongs_to :brand
* belongs_to :order_status
* belongs_to :size

## ordersテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|reference|foreign_key:true|
|product_id|reference|foreign_key:true|
|family_name_delivert|string|null:false|
|first_name_delivert|string|null:false|
|family_name_kana_delivery|string|null:false|
|city_delivery|string|null:false|
|address_delivery|string|null:false|
|building_delivery|string||
|postal_code_delivery|integer|null:false|
|phone_number_delivery|integer|null:false|
|payment_method|string|null:false|
|point|integer||

* belongs_to :user
* belongs_to :product

## pointテーブル

|Column|Type|Options|
|------|----|-------|
|point|integer||
|user_id|reference|foreign_key:true|
|point_histry|text||
|expiration_date|daytime||

* belongs_to :user

## paymentsテーブル

|Column|Type|Options|
|------|----|-------|
|card_number|integer||
|varid_year|integer||
|varid_month|integer||
|cvc|integer||
|users_id|reference|foreign_key:true|

* belongs_to :user

## evalutionテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|reference|foreign_key:true|
|rating_id|reference|foreign_key:true|
|product_id|reference|foreign_key:true|
|message|text|null:false|
|seller_position|boolean||
|buyer_position|boolean||

* belongs_to :products
* belongs_to :users
* belongs_to :rating

## ratingsテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|reference|foreign_key:true|
|rating|integer||
|product_id|integer|foreign_key:true|

* belongs_to :user
* belongs_to :product
* has_many :evalution

## profitsテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|reference|foreign_key:true|
|profit|integer||
|product_id|reference|foreign_key:true|
|experation_date|daytime||

* belongs_to :product
* belongs_to :user

## commentsテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|reference|foreign_key:true|
|product_id|reference|foreign_key:true|
|comment|text||

* belongs_to :user
* belongs_to :product

## likesテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|reference|foreign_key:true|
|product_id|reference|foreign_key:true|
|like|integer||

* belongs_to :product
* belongs_to :user

## product_purchase_messagesテーブル

|Column|Type|Options|
|------|----|-------|
|message|text||
|user_id|reference|foreign_key:true|
|product_id|reference|foreign_key:true|
|order_status_id|reference|foreign_key:true|
|seller_position|boolean||
|buyer_position|boolean||

* belongs_to :product
* belongs_to :user
* belongs_to :order_status

## imagesテーブル

|Column|Type|Options|
|------|----|-------|
|image|text|nill:false|

* belongs_to :product

## first_categoriesテーブル

|Column|Type|Options|
|------|----|-------|
|first_category|string|nill:false|

* has_many :products
* has_many :brands_categories
* has_many :second_categories

## second_categoriesテーブル

|Column|Type|Options|
|------|----|-------|
|second_category|string|nill:false|
|first_category_id|reference|foreign_key:true|
|size_category_id|reference|foreign_key:true|

* belongs_to :first_category
* belongs_to :size_category
* has_many :third_categories

## third_categoriesテーブル

|Column|Type|Options|
|------|----|-------|
|third_category|string|nill:false|
|second_category_id|reference|foreign_key:true|

* belongs_to :second_category
* has_many :products

## brandsテーブル

|Column|Type|Options|
|------|----|-------|
|brand|string|unique|
|brand_categories|reference|foreign_key:true|

* has_many :products
* has_many :brands_category

## brands_categoriesテーブル

|Column|Type|Options|
|------|----|-------|
|brand_id|reference|foreign_key:true|
|first_category_id|reference|foreign_key:true|

* belongs_to :brands
* belongs_to :first_category

## size_categoriesテーブル

|Column|Type|Options|
|------|----|-------|
|size_category|string||

* has_many :sizes
* has_many :second_categories

## sizeテーブル

|Column|Type|Options|
|------|----|-------|
|size_category_id|reference|foreign_key:true|
|size|string|null:false|

* belongs_to :size_category
* has_many :users