require "rails_helper"

RSpec.describe RecipeCategory, type: :model do
  describe "Direct Associations" do
    it { should have_many(:recipes) }
  end

  describe "InDirect Associations" do
  end

  describe "Validations" do
    it { should validate_presence_of(:category_name) }
  end
end
