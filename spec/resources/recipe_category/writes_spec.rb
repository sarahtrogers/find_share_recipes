require 'rails_helper'

RSpec.describe RecipeCategoryResource, type: :resource do
  describe 'creating' do
    let(:payload) do
      {
        data: {
          type: 'recipe_categories',
          attributes: { }
        }
      }
    end

    let(:instance) do
      RecipeCategoryResource.build(payload)
    end

    it 'works' do
      expect {
        expect(instance.save).to eq(true), instance.errors.full_messages.to_sentence
      }.to change { RecipeCategory.count }.by(1)
    end
  end

  describe 'updating' do
    let!(:recipe_category) { create(:recipe_category) }

    let(:payload) do
      {
        data: {
          id: recipe_category.id.to_s,
          type: 'recipe_categories',
          attributes: { } # Todo!
        }
      }
    end

    let(:instance) do
      RecipeCategoryResource.find(payload)
    end

    xit 'works (add some attributes and enable this spec)' do
      expect {
        expect(instance.update_attributes).to eq(true)
      }.to change { recipe_category.reload.updated_at }
      # .and change { recipe_category.foo }.to('bar') <- example
    end
  end

  describe 'destroying' do
    let!(:recipe_category) { create(:recipe_category) }

    let(:instance) do
      RecipeCategoryResource.find(id: recipe_category.id)
    end

    it 'works' do
      expect {
        expect(instance.destroy).to eq(true)
      }.to change { RecipeCategory.count }.by(-1)
    end
  end
end
