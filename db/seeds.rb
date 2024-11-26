# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# db/seeds.rb

# db/seeds.rb

# Clear existing data to avoid duplication
FoodItem.destroy_all

# Seed data for FoodItem
food_items = [
  {
    name: "Apple",
    quantity: 5,
    expiry_date: Date.today + 4,
    expected_lifetime: 4, # days
    nutri_score: "A"
  },
  {
    name: "Bread",
    quantity: 1,
    expiry_date: Date.today + 13,
    expected_lifetime: 13, # days
    nutri_score: "B"
  },
  {
    name: "Carrots",
    quantity: 6,
    expiry_date: Date.today + 2,
    expected_lifetime: 2, # days
    nutri_score: "A"
  },
  {
    name: "Milk",
    quantity: 2,
    expiry_date: Date.today + 1,
    expected_lifetime: 1, # days
    nutri_score: "C"
  },

  {
    name: "Chicken Breast",
    quantity: 1,
    expiry_date: Date.today + 10,
    expected_lifetime: 10, # days
    nutri_score: "C"
  },

    { name: "Milk", quantity: 2, expiry_date: Date.today + 1, expected_lifetime: 1, nutri_score: "C" },
    { name: "Eggs", quantity: 18, expiry_date: Date.today + 14, expected_lifetime: 14, nutri_score: "B" },
    { name: "Chicken Breast", quantity: 1, expiry_date: Date.today + 10, expected_lifetime: 10, nutri_score: "C" },
    { name: "Rice", quantity: 50, expiry_date: Date.today - 1, expected_lifetime: 0, nutri_score: "A" },
    { name: "Apples", quantity: 10, expiry_date: Date.today + 5, expected_lifetime: 5, nutri_score: "A" },
    { name: "Bananas", quantity: 6, expiry_date: Date.today + 2, expected_lifetime: 2, nutri_score: "A" },
    { name: "Yogurt", quantity: 4, expiry_date: Date.today + 6, expected_lifetime: 6, nutri_score: "B" },
    { name: "Cheddar Cheese", quantity: 1, expiry_date: Date.today + 15, expected_lifetime: 15, nutri_score: "C" },
    { name: "Orange Juice", quantity: 3, expiry_date: Date.today + 3, expected_lifetime: 3, nutri_score: "B" },
    { name: "Whole Grain Bread", quantity: 2, expiry_date: Date.today + 2, expected_lifetime: 2, nutri_score: "A" },
    { name: "Tomatoes", quantity: 8, expiry_date: Date.today + 3, expected_lifetime: 3, nutri_score: "A" },
    { name: "Potatoes", quantity: 20, expiry_date: Date.today + 15, expected_lifetime: 15, nutri_score: "B" },
    { name: "Carrots", quantity: 10, expiry_date: Date.today + 7, expected_lifetime: 7, nutri_score: "A" },
    { name: "Pasta", quantity: 5, expiry_date: Date.today + 30, expected_lifetime: 30, nutri_score: "B" },
    { name: "Salmon Fillet", quantity: 2, expiry_date: Date.today + 4, expected_lifetime: 4, nutri_score: "B" },
    { name: "Butter", quantity: 1, expiry_date: Date.today + 20, expected_lifetime: 20, nutri_score: "C" },
    { name: "Peanut Butter", quantity: 2, expiry_date: Date.today + 90, expected_lifetime: 90, nutri_score: "B" },
    { name: "Cereal", quantity: 3, expiry_date: Date.today + 60, expected_lifetime: 60, nutri_score: "B" },
    { name: "Cucumber", quantity: 4, expiry_date: Date.today + 2, expected_lifetime: 2, nutri_score: "A" },
    { name: "Bell Peppers", quantity: 6, expiry_date: Date.today + 4, expected_lifetime: 4, nutri_score: "A" },
    { name: "Chocolate Bar", quantity: 5, expiry_date: Date.today + 150, expected_lifetime: 150, nutri_score: "D" },
    { name: "Strawberries", quantity: 12, expiry_date: Date.today + 1, expected_lifetime: 1, nutri_score: "A" },
    { name: "Avocado", quantity: 3, expiry_date: Date.today + 2, expected_lifetime: 2, nutri_score: "B" },
    { name: "Onions", quantity: 15, expiry_date: Date.today + 20, expected_lifetime: 20, nutri_score: "B" },
    { name: "Garlic", quantity: 10, expiry_date: Date.today + 60, expected_lifetime: 60, nutri_score: "B" },
    { name: "Almond Milk", quantity: 2, expiry_date: Date.today + 15, expected_lifetime: 15, nutri_score: "A" },
    { name: "Tofu", quantity: 2, expiry_date: Date.today + 7, expected_lifetime: 7, nutri_score: "A" },
    { name: "Ham", quantity: 1, expiry_date: Date.today + 5, expected_lifetime: 5, nutri_score: "C" },
    { name: "Frozen Peas", quantity: 10, expiry_date: Date.today + 365, expected_lifetime: 365, nutri_score: "A" },
    { name: "Ice Cream", quantity: 3, expiry_date: Date.today + 30, expected_lifetime: 30, nutri_score: "D" },
    { name: "Granola", quantity: 4, expiry_date: Date.today + 60, expected_lifetime: 60, nutri_score: "B" },
    { name: "Lentils", quantity: 8, expiry_date: Date.today + 365, expected_lifetime: 365, nutri_score: "A" },
    { name: "Canned Tuna", quantity: 6, expiry_date: Date.today + 730, expected_lifetime: 730, nutri_score: "B" },
    { name: "Chickpeas", quantity: 4, expiry_date: Date.today + 730, expected_lifetime: 730, nutri_score: "A" },
    { name: "Beef Steak", quantity: 2, expiry_date: Date.today + 5, expected_lifetime: 5, nutri_score: "C" },
    { name: "Cabbage", quantity: 2, expiry_date: Date.today + 15, expected_lifetime: 15, nutri_score: "A" },
    { name: "Spinach", quantity: 5, expiry_date: Date.today + 3, expected_lifetime: 3, nutri_score: "A" },
    { name: "Honey", quantity: 1, expiry_date: Date.today + 1095, expected_lifetime: 1095, nutri_score: "B" },
    { name: "Frozen Pizza", quantity: 2, expiry_date: Date.today + 180, expected_lifetime: 180, nutri_score: "C" },
    { name: "Blackberries", quantity: 10, expiry_date: Date.today + 2, expected_lifetime: 2, nutri_score: "A" }


]

# Create records in the database
food_items.each do |item|
  FoodItem.create!(item)
end
