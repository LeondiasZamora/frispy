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
    name: "Eggs",
    quantity: 18,
    expiry_date: Date.today + 14,
    expected_lifetime: 4, # days
    nutri_score: "B"
  },
  {
    name: "Chicken Breast",
    quantity: 1,
    expiry_date: Date.today + 10,
    expected_lifetime: 10, # days
    nutri_score: "C"
  },
  {
    name: "Rice",
    quantity: 50,
    expiry_date: Date.today - 1,
    expected_lifetime: 0, # days
    nutri_score: "A"
  }
]

# Create records in the database
food_items.each do |item|
  FoodItem.create!(item)
end
