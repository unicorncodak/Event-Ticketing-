require 'rails_helper'

RSpec.describe Category, type: :model do
  context 'Validation tests' do
    it 'ensures title presence' do
      category = Category.new(id: 1).save
      expect(category).to eq(false)
    end

    it 'ensures should save successfully' do
      category = Category.new(id: 1, title: "Business").save
      expect(category).to eq(true)
    end
  end

  context 'Associations' do
    it { should have_many(:events) }
  end

  
end
