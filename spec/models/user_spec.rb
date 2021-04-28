require 'rails_helper'

RSpec.describe User, type: :model do
  context 'validation' do
    before(:each) do
      User.destroy_all
    end

    it 'should check the uniqueness of the username' do
      create(:user)
      user = build(:user)
      user.validate
      expect(user.errors.messages).to include(:username)
      expect(user.errors.messages[:username]).to include("has already been taken")
    end

    it 'should persist the user if validation are ok' do
      n_users = User.count
      create(:user)
      expect(User.count).to eq(n_users + 1)
    end
  end
end
