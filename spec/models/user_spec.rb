# spec/models/user_spec.rb
require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it 'is valid with a name' do
      user = create(:user)
      expect(user).to be_valid
    end

    it 'is invalid without a name' do
      user = User.new(name: nil, email: 'burger@example.com', password: '123456')
      expect(user).not_to be_valid
      expect(user.errors[:name]).to include("can't be blank")
    end

    it 'is invalid without an email' do
      user = User.new(name: 'Burger', email: nil, password: '123456')
      expect(user).not_to be_valid
      expect(user.errors[:email]).to include("can't be blank")
    end

    it 'is invalid without a password' do
      user = User.new(name: 'Burger', email: 'burger@example.com', password: nil)
      expect(user).not_to be_valid
      expect(user.errors[:password]).to include("can't be blank")
    end
  end
end
