require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    it 'is valid with valid attributes' do
      user = User.new(name: 'John Doe', email: 'john.doe@example.com')
      expect(user).to be_valid
    end

    it 'is invalid without a name' do
      user = User.new(name: nil, email: 'john.doe@example.com')
      expect(user).not_to be_valid
    end

    it 'is invalid without an email' do
      user = User.new(name: 'John Doe', email: nil)
      expect(user).not_to be_valid
    end
  end
end
