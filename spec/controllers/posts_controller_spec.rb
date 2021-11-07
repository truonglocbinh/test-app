require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  let(:user) { create(:user) }

  before(:each) do
    sign_in(user)
  end

  describe "GET index" do
    it "has a 200 status code" do
      get :index
      expect(response).to have_http_status(200)
    end
  end

  describe "POST create" do
    context "with valid params" do
      it "create new post and redirect" do
        post :create, params: { post: attributes_for(:post) }
        expect(Post.all.size).to eq(1)
        expect(response).to have_http_status(302)
      end
    end

    context "with invalid params" do
      it "has a 422 status code" do
        post :create, params: { post: attributes_for(:post, :invalid) }
        expect(response).to have_http_status(422)
      end

      it 'does not create new post' do
        expect do
          post :create, params: { post: attributes_for(:post, :invalid) }
        end.to change(Post, :count).by(0)
      end
    end
  end
end
