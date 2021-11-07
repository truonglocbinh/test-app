require "rails_helper"

RSpec.describe "login", type: :request do
  let(:user) { create(:user) }

  context "success" do
    it 'show errors' do
      post '/users/sign_in', params: { user: { email: user.email, password: 'password', remember_me: '0 ' } }
      expect(response.status).to eq(302)
      follow_redirect!
      expect(flash[:notice]).to eq('Signed in successfully.')
    end
  end

  # context "fail" do
  #   it 'render errors' do
  #     # gets '/'
  #     post '/users/sign_in', params: {user: { email: user.email, password: '', remember_me: '0 '}}

  #     # binding.pry

  #     expect(response.parsed_body).to contain
  #   end
  # end

  # after(:context) do
  #   @user.destroy
  # end
end

# test controller

# status code
# expected template
# flash messages
# redirect url
