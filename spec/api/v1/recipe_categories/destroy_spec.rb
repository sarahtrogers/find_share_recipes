require "rails_helper"

RSpec.describe "recipe_categories#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/recipe_categories/#{recipe_category.id}"
  end

  describe "basic destroy" do
    let!(:recipe_category) { create(:recipe_category) }

    it "updates the resource" do
      expect(RecipeCategoryResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { RecipeCategory.count }.by(-1)
      expect { recipe_category.reload }.
        to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq("meta" => {})
    end
  end
end
