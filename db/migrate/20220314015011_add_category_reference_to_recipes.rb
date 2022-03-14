class AddCategoryReferenceToRecipes < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :recipes, :recipe_categories, column: :category_id
    add_index :recipes, :category_id
    change_column_null :recipes, :category_id, false
  end
end
