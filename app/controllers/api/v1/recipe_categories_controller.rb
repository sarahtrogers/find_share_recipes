class Api::V1::RecipeCategoriesController < Api::V1::GraphitiController
  def index
    recipe_categories = RecipeCategoryResource.all(params)
    respond_with(recipe_categories)
  end

  def show
    recipe_category = RecipeCategoryResource.find(params)
    respond_with(recipe_category)
  end

  def create
    recipe_category = RecipeCategoryResource.build(params)

    if recipe_category.save
      render jsonapi: recipe_category, status: :created
    else
      render jsonapi_errors: recipe_category
    end
  end

  def update
    recipe_category = RecipeCategoryResource.find(params)

    if recipe_category.update_attributes
      render jsonapi: recipe_category
    else
      render jsonapi_errors: recipe_category
    end
  end

  def destroy
    recipe_category = RecipeCategoryResource.find(params)

    if recipe_category.destroy
      render jsonapi: { meta: {} }, status: :ok
    else
      render jsonapi_errors: recipe_category
    end
  end
end
