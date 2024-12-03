class AddUnitToFoodItems < ActiveRecord::Migration[7.1]
  def change
    add_column :food_items, :unit, :string
  end
end
