require 'rails_helper'

RSpec.describe "recipe_categories#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/recipe_categories/#{recipe_category.id}", payload
  end

  describe 'basic update' do
    let!(:recipe_category) { create(:recipe_category) }

    let(:payload) do
      {
        data: {
          id: recipe_category.id.to_s,
          type: 'recipe_categories',
          attributes: {
            # ... your attrs here
          }
        }
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit 'updates the resource' do
      expect(RecipeCategoryResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { recipe_category.reload.attributes }
    end
  end
end
