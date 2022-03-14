class CreateRecipes < ActiveRecord::Migration[6.0]
  def change
    create_table :recipes do |t|
      t.string :photo
      t.text :name
      t.text :ingredients
      t.integer :category_id
      t.text :dietary_restrictions
      t.integer :user_id

      t.timestamps
    end
  end
end
