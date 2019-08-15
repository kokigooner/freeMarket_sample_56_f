# require 'rails_helper'

#   before do 
#     request.env["devise.mapping"] = Devise.mappings[:user] # Deviseを使う場合
#     request.env["omniauth.auth"] = OmniAuth.config.mock_auth[:facebook] 
#   end

#   def failure
#     redirect_to root_path if current_user
#   end


#   RSpec.describe OmniauthCallbacksController, type: :controller do
#     before { request.env["omniauth.auth"] = facebook_mock }
#     subject { get :create, params: { provider: "facebook" } }
    
#     context "provider, uid, email, nameがある場合" do
#       it "トップページにリダイレクト" do
#         expect { subject }.to change { User.count }.from(0).to(1)
#         expect { subject }.to change { Sns_credential.count }.from(0).to(1)
#         expect(subject).to redirect_to root_path
#       end
#     end

#     context "provider, uid, email, nameがない場合" do
#       it "登録画面へリダイレクト" do
#         request.env["omniauth.auth"]["info"]["email"] = nil
#         request.env['omniauth.auth']["uid"] = nil
#         request.env['omniauth.auth']["provider"] = nil
#         request.env['omniauth.auth']["info"]["name"] = nil
#         expect(subject).to redirects_to users_signup_registration_path
#       end
#     end
#   end

#   RSpec.describe "omniauth", type: :request do

#     describe "GET #failure" do
#       let(:user) { create(:user) }
#       before { request.env["omniauth.auth"] = facebook_invalid_mock }
#       subject { get :create, params: { provider: "facebook" }

#       it "current_userが存在する" do
#         sigin_in user
#         expect(subject).to redirect_to user_setting_social_profiles_path
#       end
#       it "current_userが存在しない" do
#         expect(subject).to render_template :failure
#       end
#     end
#   end
# end