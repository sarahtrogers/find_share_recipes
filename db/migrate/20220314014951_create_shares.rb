class CreateShares < ActiveRecord::Migration[6.0]
  def change
    create_table :shares do |t|
      t.integer :recipe_id
      t.integer :recipient_id

      t.timestamps
    end
  end
end
