crumb :root do
  link 'メルカリ', root_path
end

crumb :user do |user|
  link 'マイページ',"/users/mypage"
end

crumb :search do |product|
  link "#{params[:q][:product_name_cont_all].join(" ")}", ""
end

crumb :mypage_identification do |user|
  link "本人情報の登録 ", "/mypage/identification"
  parent :user, user
end


crumb :mypage_card do |user|
  link "支払い方法", "/mypage/card"
  parent :user, user
end

crumb :profile do |user|
  link "プロフィール", "/users/mypage/profile"
  parent :user, user
end

crumb :myitems do |user|
  link "出品した商品・出品中", "/users/mypage/#{current_user.id}/myitems"
  parent :user, user
end
