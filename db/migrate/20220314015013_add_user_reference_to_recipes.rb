class AddUserReferenceToRecipes < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :recipes, :users
    add_index :recipes, :user_id
    change_column_null :recipes, :user_id, false
  end
end
