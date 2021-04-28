require 'rails_helper'

RSpec.describe Url, type: :model do
  context 'validation' do
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
end
