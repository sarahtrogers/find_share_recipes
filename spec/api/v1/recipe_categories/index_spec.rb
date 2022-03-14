require 'rails_helper'

RSpec.describe "recipe_categories#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/recipe_categories", params: params
  end

  describe 'basic fetch' do
    let!(:recipe_category1) { create(:recipe_category) }
    let!(:recipe_category2) { create(:recipe_category) }

    it 'works' do
      expect(RecipeCategoryResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(['recipe_categories'])
      expect(d.map(&:id)).to match_array([recipe_category1.id, recipe_category2.id])
    end
  end
end
