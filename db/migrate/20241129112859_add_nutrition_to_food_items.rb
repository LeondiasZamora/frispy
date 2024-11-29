class AddNutritionToFoodItems < ActiveRecord::Migration[7.1]
  def change
    add_column :food_items, :calories, :integer
    add_column :food_items, :protein, :integer
    add_column :food_items, :fats, :integer
    add_column :food_items, :carbs, :integer
  end
end
