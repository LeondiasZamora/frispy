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
User.destroy_all

user = User.new(email: "a@a.a", password: "123456")
user.save

# Seed data for FoodItem
food_items = [
  {
    name: "Apple",
    quantity: 5,
    expiry_date: Date.today + 4,
    expected_lifetime: 4, # days
    nutri_score: "A",
    user: User.first
  },
  {
    name: "Bread",
    quantity: 1,
    expiry_date: Date.today + 13,
    expected_lifetime: 13, # days
    nutri_score: "B",
    user: User.first
  },
  {
    name: "Carrots",
    quantity: 6,
    expiry_date: Date.today + 2,
    expected_lifetime: 2, # days
    nutri_score: "A",
    user: User.first
  },
  {
    name: "Milk",
    quantity: 2,
    expiry_date: Date.today + 1,
    expected_lifetime: 1, # days
    nutri_score: "C",
    user: User.first
  },

  {
    name: "Chicken Breast",
    quantity: 1,
    expiry_date: Date.today + 10,
    expected_lifetime: 10, # days
    nutri_score: "C",
    user: User.first
  },

    { name: "Milk", quantity: 2, expiry_date: Date.today + 1, expected_lifetime: 1, nutri_score: "C", user: User.first },
    { name: "Eggs", quantity: 18, expiry_date: Date.today + 14, expected_lifetime: 14, nutri_score: "B", user: User.first },
    { name: "Chicken Breast", quantity: 1, expiry_date: Date.today + 10, expected_lifetime: 10, nutri_score: "C", user: User.first },
    { name: "Rice", quantity: 50, expiry_date: Date.today - 1, expected_lifetime: 0, nutri_score: "A", user: User.first },
    { name: "Apples", quantity: 10, expiry_date: Date.today + 5, expected_lifetime: 5, nutri_score: "A", user: User.first },
    { name: "Bananas", quantity: 6, expiry_date: Date.today + 2, expected_lifetime: 2, nutri_score: "A", user: User.first },
    { name: "Yogurt", quantity: 4, expiry_date: Date.today + 6, expected_lifetime: 6, nutri_score: "B", user: User.first },
    { name: "Cheddar Cheese", quantity: 1, expiry_date: Date.today + 15, expected_lifetime: 15, nutri_score: "C", user: User.first },
    { name: "Orange Juice", quantity: 3, expiry_date: Date.today + 3, expected_lifetime: 3, nutri_score: "B", user: User.first },
    { name: "Whole Grain Bread", quantity: 2, expiry_date: Date.today + 2, expected_lifetime: 2, nutri_score: "A", user: User.first },
    { name: "Tomatoes", quantity: 8, expiry_date: Date.today + 3, expected_lifetime: 3, nutri_score: "A", user: User.first },
    { name: "Potatoes", quantity: 20, expiry_date: Date.today + 15, expected_lifetime: 15, nutri_score: "B", user: User.first },
    { name: "Carrots", quantity: 10, expiry_date: Date.today + 7, expected_lifetime: 7, nutri_score: "A", user: User.first },
    { name: "Pasta", quantity: 5, expiry_date: Date.today + 30, expected_lifetime: 30, nutri_score: "B", user: User.first },
    { name: "Salmon Fillet", quantity: 2, expiry_date: Date.today + 4, expected_lifetime: 4, nutri_score: "B", user: User.first },
    { name: "Butter", quantity: 1, expiry_date: Date.today + 20, expected_lifetime: 20, nutri_score: "C", user: User.first },
    { name: "Peanut Butter", quantity: 2, expiry_date: Date.today + 90, expected_lifetime: 90, nutri_score: "B", user: User.first },
    { name: "Cereal", quantity: 3, expiry_date: Date.today + 60, expected_lifetime: 60, nutri_score: "B", user: User.first },
    { name: "Cucumber", quantity: 4, expiry_date: Date.today + 2, expected_lifetime: 2, nutri_score: "A", user: User.first },
    { name: "Bell Peppers", quantity: 6, expiry_date: Date.today + 4, expected_lifetime: 4, nutri_score: "A", user: User.first },
    { name: "Chocolate Bar", quantity: 5, expiry_date: Date.today + 150, expected_lifetime: 150, nutri_score: "D", user: User.first },
    { name: "Strawberries", quantity: 12, expiry_date: Date.today + 1, expected_lifetime: 1, nutri_score: "A", user: User.first },
    { name: "Avocado", quantity: 3, expiry_date: Date.today + 2, expected_lifetime: 2, nutri_score: "B", user: User.first },
    { name: "Onions", quantity: 15, expiry_date: Date.today + 20, expected_lifetime: 20, nutri_score: "B", user: User.first },
    { name: "Garlic", quantity: 10, expiry_date: Date.today + 60, expected_lifetime: 60, nutri_score: "B", user: User.first },
    { name: "Almond Milk", quantity: 2, expiry_date: Date.today + 15, expected_lifetime: 15, nutri_score: "A", user: User.first },
    { name: "Tofu", quantity: 2, expiry_date: Date.today + 7, expected_lifetime: 7, nutri_score: "A", user: User.first },
    { name: "Ham", quantity: 1, expiry_date: Date.today + 5, expected_lifetime: 5, nutri_score: "C", user: User.first },
    { name: "Frozen Peas", quantity: 10, expiry_date: Date.today + 365, expected_lifetime: 365, nutri_score: "A", user: User.first },
    { name: "Ice Cream", quantity: 3, expiry_date: Date.today + 30, expected_lifetime: 30, nutri_score: "D", user: User.first },
    { name: "Granola", quantity: 4, expiry_date: Date.today + 60, expected_lifetime: 60, nutri_score: "B", user: User.first },
    { name: "Lentils", quantity: 8, expiry_date: Date.today + 365, expected_lifetime: 365, nutri_score: "A", user: User.first },
    { name: "Canned Tuna", quantity: 6, expiry_date: Date.today + 730, expected_lifetime: 730, nutri_score: "B", user: User.first },
    { name: "Chickpeas", quantity: 4, expiry_date: Date.today + 730, expected_lifetime: 730, nutri_score: "A", user: User.first },
    { name: "Beef Steak", quantity: 2, expiry_date: Date.today + 5, expected_lifetime: 5, nutri_score: "C", user: User.first },
    { name: "Cabbage", quantity: 2, expiry_date: Date.today + 15, expected_lifetime: 15, nutri_score: "A", user: User.first },
    { name: "Spinach", quantity: 5, expiry_date: Date.today + 3, expected_lifetime: 3, nutri_score: "A", user: User.first },
    { name: "Honey", quantity: 1, expiry_date: Date.today + 1095, expected_lifetime: 1095, nutri_score: "B", user: User.first },
    { name: "Frozen Pizza", quantity: 2, expiry_date: Date.today + 180, expected_lifetime: 180, nutri_score: "C", user: User.first },
    { name: "Blackberries", quantity: 10, expiry_date: Date.today + 2, expected_lifetime: 2, nutri_score: "A", user: User.first }


]

# Create records in the database
food_items.each do |item|
  FoodItem.create!(item)
end
