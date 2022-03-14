class AddRecipeReferenceToShares < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :shares, :recipes
    add_index :shares, :recipe_id
    change_column_null :shares, :recipe_id, false
  end
end
