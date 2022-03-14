class AddRecipeReferenceToRatings < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :ratings, :recipes
    add_index :ratings, :recipe_id
    change_column_null :ratings, :recipe_id, false
  end
end
