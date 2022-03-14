require "rails_helper"

RSpec.describe "recipe_categories#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/recipe_categories/#{recipe_category.id}",
                params: params
  end

  describe "basic fetch" do
    let!(:recipe_category) { create(:recipe_category) }

    it "works" do
      expect(RecipeCategoryResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq("recipe_categories")
      expect(d.id).to eq(recipe_category.id)
    end
  end
end
