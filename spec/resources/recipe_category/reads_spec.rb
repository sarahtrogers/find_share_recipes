require "rails_helper"

RSpec.describe RecipeCategoryResource, type: :resource do
  describe "serialization" do
    let!(:recipe_category) { create(:recipe_category) }

    it "works" do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(recipe_category.id)
      expect(data.jsonapi_type).to eq("recipe_categories")
    end
  end

  describe "filtering" do
    let!(:recipe_category1) { create(:recipe_category) }
    let!(:recipe_category2) { create(:recipe_category) }

    context "by id" do
      before do
        params[:filter] = { id: { eq: recipe_category2.id } }
      end

      it "works" do
        render
        expect(d.map(&:id)).to eq([recipe_category2.id])
      end
    end
  end

  describe "sorting" do
    describe "by id" do
      let!(:recipe_category1) { create(:recipe_category) }
      let!(:recipe_category2) { create(:recipe_category) }

      context "when ascending" do
        before do
          params[:sort] = "id"
        end

        it "works" do
          render
          expect(d.map(&:id)).to eq([
                                      recipe_category1.id,
                                      recipe_category2.id,
                                    ])
        end
      end

      context "when descending" do
        before do
          params[:sort] = "-id"
        end

        it "works" do
          render
          expect(d.map(&:id)).to eq([
                                      recipe_category2.id,
                                      recipe_category1.id,
                                    ])
        end
      end
    end
  end

  describe "sideloading" do
    # ... your tests ...
  end
end
