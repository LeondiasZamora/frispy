class AddUserToFoodItems < ActiveRecord::Migration[7.1]
  def change
    add_reference :food_items, :user, null: false, foreign_key: true
  end
end
