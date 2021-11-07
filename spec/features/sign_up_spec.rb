require "rails_helper"

RSpec.describe "sign up", type: :request do
  context "valid" do
    it 'should create new account' do
      get '/users/sign_up'
      post '/users',
           params: { "user" => { "email" => "truonglocbinh93+2@gmail.com", "name" => "binhtruong", "password" => "password",
                                 "password_confirmation" => "password" } }
      expect(response.status).to eq(302)
      follow_redirect!
      expect(flash[:notice]).to eq('Welcome! You have signed up successfully.')
    end
  end
end
