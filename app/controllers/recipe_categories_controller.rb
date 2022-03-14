class RecipeCategoriesController < ApplicationController
  before_action :set_recipe_category, only: %i[show edit update destroy]

  def index
    @q = RecipeCategory.ransack(params[:q])
    @recipe_categories = @q.result(distinct: true).includes(:recipes).page(params[:page]).per(10)
  end

  def show
    @recipe = Recipe.new
  end

  def new
    @recipe_category = RecipeCategory.new
  end

  def edit; end

  def create
    @recipe_category = RecipeCategory.new(recipe_category_params)

    if @recipe_category.save
      redirect_to @recipe_category,
                  notice: "Recipe category was successfully created."
    else
      render :new
    end
  end

  def update
    if @recipe_category.update(recipe_category_params)
      redirect_to @recipe_category,
                  notice: "Recipe category was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @recipe_category.destroy
    redirect_to recipe_categories_url,
                notice: "Recipe category was successfully destroyed."
  end

  private

  def set_recipe_category
    @recipe_category = RecipeCategory.find(params[:id])
  end

  def recipe_category_params
    params.require(:recipe_category).permit(:category_name)
  end
end
