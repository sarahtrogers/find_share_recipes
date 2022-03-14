class AddRecipeReferenceToComments < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :comments, :recipes
    add_index :comments, :recipe_id
    change_column_null :comments, :recipe_id, false
  end
end
