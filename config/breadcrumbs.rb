crumb :root do
  link 'メルカリ', root_path
end

crumb :user do |user|
  link 'マイページ',"/users/mypage/#{current_user.id}"
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

