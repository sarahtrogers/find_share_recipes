class RecipesController < ApplicationController
  before_action :current_user_must_be_recipe_user,
                only: %i[edit update destroy]

  before_action :set_recipe, only: %i[show edit update destroy]

  def index
    @q = Recipe.ransack(params[:q])
    @recipes = @q.result(distinct: true).includes(:user, :comments,
                                                  :ratings, :shares, :category).page(params[:page]).per(10)
  end

  def show
    @share = Share.new
    @rating = Rating.new
    @comment = Comment.new
  end

  def new
    @recipe = Recipe.new
  end

  def edit; end

  def create
    @recipe = Recipe.new(recipe_params)

    if @recipe.save
      message = "Recipe was successfully created."
      if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referer, notice: message
      else
        redirect_to @recipe, notice: message
      end
    else
      render :new
    end
  end

  def update
    if @recipe.update(recipe_params)
      redirect_to @recipe, notice: "Recipe was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @recipe.destroy
    message = "Recipe was successfully deleted."
    if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referer, notice: message
    else
      redirect_to recipes_url, notice: message
    end
  end

  private

  def current_user_must_be_recipe_user
    set_recipe
    unless current_user == @recipe.user
      redirect_back fallback_location: root_path,
                    alert: "You are not authorized for that."
    end
  end

  def set_recipe
    @recipe = Recipe.find(params[:id])
  end

  def recipe_params
    params.require(:recipe).permit(:photo, :name, :ingredients, :category_id,
                                   :dietary_restrictions, :user_id)
  end
end
