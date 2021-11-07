require "rails_helper"

RSpec.describe "Post management", type: :request do
  let(:current_user) { create(:user) }
  let(:new_post) { create(:post, :association) }

  before(:each) do
    sign_in(current_user)
  end

  describe "#create" do
    context 'valid params' do
      it "creates a Post and redirects to the Post's page" do
        post '/posts', params: { post: attributes_for(:post) }
        expect(response).to have_http_status(302)
        follow_redirect!
        expect(response.body).to include('Post was successfully created.')
      end
    end

    context "invalid params" do
      it 'render errors' do
        post '/posts', params: { post: attributes_for(:post, :invalid) }
        expect(response).to have_http_status(422)
        expect(response.body).to include("Body can&#39;t be blank")
      end
    end
  end

  describe "GET /show" do
    it 'renders successful response' do
      get post_path(new_post)
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it 'renders successful response' do
      get edit_post_path(new_post)
      expect(response).to be_successful
    end
  end

  describe 'PATCH /update' do
    context 'with valid parameters' do
      let(:new_attributes) do
        {
          body: 'New body of post'
        }
      end

      it 'updates successful post' do
        patch post_path(new_post), params: { post: new_attributes }
        expect(response).to have_http_status(302)
        follow_redirect!
        expect(response.body).to include('Post was successfully updated.')
        # expect(post.body).to eq(new_attributes[:body])
      end
    end

    context "with invalid parameters" do
      let(:invalid_attributes) { { body: '' } }
      it 'update fail' do
        patch post_path(new_post), params: { post: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
        # binding.pry
      end
    end
  end

  describe "DELETE /destroy" do
    it 'destroys the post' do
      delete post_path(new_post)
      expect(response).to have_http_status(302)
      follow_redirect!
      expect(response.body).to include('Post was successfully destroyed.')
    end
  end
end
