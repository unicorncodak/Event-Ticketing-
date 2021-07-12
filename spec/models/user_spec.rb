require 'rails_helper'

RSpec.describe User, type: :model do
  context 'Validation tests' do
    it 'ensures firstname presence' do
      user = User.new(id: 1, lastname: "Bob", email: "bob@exapmle.com", password: "12345").save
      expect(user).to eq(false)
    end

    it 'ensures lastname presence' do
      user = User.new(id: 1, firstname: "Bob", email: "bob@exapmle.com", password: "12345").save
      expect(user).to eq(false)
    end

    it 'ensures email presence' do
      user = User.new(id: 1, lastname: "Bob", firstname:"Jon", password: "12345").save
      expect(user).to eq(false)
    end

    it 'ensures password presence' do
      user = User.new(id: 1, lastname: "Bob", email: "bob@exapmle.com", email: "bob@exapmle.com").save
      expect(user).to eq(false)
    end

    it 'ensures should save successfully' do
      user = User.new(id: 1, firstname: "Bob", lastname: "Jon", email: "bob@exapmle.com", password: "12345").save
      expect(user).to eq(true)
    end
  end

  context 'Associations' do
    it { should have_many(:events) }
  end
end
