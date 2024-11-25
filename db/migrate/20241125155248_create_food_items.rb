class CreateFoodItems < ActiveRecord::Migration[7.1]
  def change
    create_table :food_items do |t|
      t.string :name
      t.integer :quantity
      t.date :expiry_date
      t.integer :expected_lifetime
      t.string :nutri_score

      t.timestamps
    end
  end
end
