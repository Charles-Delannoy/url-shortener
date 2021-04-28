require 'rails_helper'

RSpec.describe User, type: :model do
  context 'validation' do
    it 'should check the uniqueness of the username' do
      create(:user)
      user = build(:user)
      user.validate
      expect(url.errors.messages).to include(:username)
      expect(url.errors.messages[:username]).to include("has already been taken")
    end
  end
end
