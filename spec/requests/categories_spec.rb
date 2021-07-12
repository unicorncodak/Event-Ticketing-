require 'rails_helper'

RSpec.describe "Categories", type: :request do
  let(:categorys) { FactoryBot.create(:category) }

  before(:all) do
    @category = Category.create(title: "Business")
  end
  describe "GET /categories" do
    it "works! (now write some real specs)" do
      get categories_path
      expect(response).to have_http_status(200)
    end
  end

  describe "GET /categories" do
    it "show a category" do
      get categories_path(categorys)
      expect(response).to have_http_status(200)
    end
  end

  describe "POST /categories" do
    it 'creates a new category' do
      expect( @category).to be_valid
    end
  end

  describe "PUT /categories" do
    it 'checks that a category can be updated' do
      @category.update(:title => "Food & Fashion")
      expect(Category.find_by_title("Food & Fashion")).to eq(@category)
    end
  end
end
