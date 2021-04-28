require 'rails_helper'

RSpec.describe Url, type: :model do
  context 'validation' do
    before(:each) do
      Url.destroy_all
    end

    it 'should check the format of the base_url' do
      url = Url.new(base_url: "snjzk#")
      url.validate
      expect(url.errors.messages).to include(:base_url)
      expect(url.errors.messages[:base_url]).to include("is invalid")
    end

    it 'should check the uniqueness of the generated_token' do
      create(:url)
      url = build(:url)
      url.validate
      expect(url.errors.messages).to include(:generated_token)
      expect(url.errors.messages[:generated_token]).to include("has already been taken")
    end

    it 'should persist the url if validation are ok' do
      n_urls = Url.count
      create(:url)
      expect(Url.count).to eq(n_urls + 1)
    end
  end

  context 'user association' do
    after(:all) do
      Url.destroy_all
      User.destroy_all
    end

    let(:url) { create(:url) }

    it '#user should return nil if there is no user' do
      expect(url.user).to eq(nil)
    end

    it '#user should the linked user instance' do
      url.user = create(:user)
      expect(url.user).to be_a(User)
    end
  end
end
