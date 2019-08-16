# module OmniauthMocks
#   def facebook_mock
#     Omniauth.config.mock_auth[:facebook] = OmniAuth: :AuthHash.new({
#       "provider" = "facebook",
#       "uid" = "123456",
#       "name" = "メルカリ　太朗"
#       "email" = "aaa@gmail.com"
#     })
#   end

#   def google_mock
#     Omniauth.config.mock_auth[:google]
#       "provider" = "google",
#       "uid" = "123456",
#       "name" = "メルカリ　太朗"
#       "email" = "aaa@gmail.com"
#     })
#   end

#   def facebook_invalid_mock
#     OmniAuth.config.mock_auth[:facebook] = :invalid_credentails
#   end
# end