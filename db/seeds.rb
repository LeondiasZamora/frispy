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
    quantity: 20,
    expiry_date: Date.today + 10,
    expected_lifetime: 14, # days
    nutri_score: "A"
  },
  {
    name: "Bread",
    quantity: 10,
    expiry_date: Date.today + 5,
    expected_lifetime: 7, # days
    nutri_score: "B"
  },
  {
    name: "Carrots",
    quantity: 15,
    expiry_date: Date.today + 12,
    expected_lifetime: 21, # days
    nutri_score: "A"
  },
  {
    name: "Milk",
    quantity: 8,
    expiry_date: Date.today + 7,
    expected_lifetime: 10, # days
    nutri_score: "C"
  },
  {
    name: "Eggs",
    quantity: 30,
    expiry_date: Date.today + 14,
    expected_lifetime: 21, # days
    nutri_score: "B"
  },
  {
    name: "Chicken Breast",
    quantity: 5,
    expiry_date: Date.today + 3,
    expected_lifetime: 4, # days
    nutri_score: "C"
  },
  {
    name: "Rice",
    quantity: 50,
    expiry_date: Date.today + 365,
    expected_lifetime: 730, # days
    nutri_score: "A"
  }
]

# Create records in the database
food_items.each do |item|
  FoodItem.create!(item)
end
