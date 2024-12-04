class ChangeQuantityToFloatInFoodItems < ActiveRecord::Migration[7.1]
  def change
        change_column :food_items, :quantity, :float
  end
end
