require 'rails_helper'

RSpec.describe UrlsController, type: :controller do
  fixtures :users

  describe 'POST #create' do
    context 'valid params' do
      before(:each) do
        post :create, params: { url: attributes_for(:url) }
      end
      it 'should render the root template' do
        expect(response).to render_template("pages/home")
      end

      it 'should persisted the url' do
        expect(Url.count).to eq(1)
      end

      it 'should create the @saved_url' do
        expect(assigns(:saved_url)).to be_a(Url)
      end
    end

    context 'logged in user' do
      before(:each) do
        sign_in users(:user_test)
        post :create, params: { url: attributes_for(:url) }
      end
      it 'should link the url to the user' do
        expect(assigns(:saved_url).user).to be_a(User)
      end

      it 'should render the urls index' do
        expect(response).to render_template("urls/index")
      end
    end

    context 'invalid params' do
      before(:each) do
        post :create, params: { url: attributes_for(:short_token_url) }
      end
      it 'should render the root template' do
        expect(response).to render_template("pages/home")
      end

      it 'should contain the validation error' do
        expect(assigns(:url).errors.messages).to include(:generated_token)
      end

      it 'should not create the @saved_url' do
        expect(assigns(:saved_url)).to eq(nil)
      end
    end
  end
end
