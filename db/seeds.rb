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
      expected_lifetime: 4,
      nutri_score: "A",
      protein: 0.3,
      carbs: 14,
      fats: 0.2,
      calories: 52,
      user: User.first
    },
    {
      name: "Bread",
      quantity: 1,
      expiry_date: Date.today + 13,
      expected_lifetime: 13,
      nutri_score: "B",
      protein: 9,
      carbs: 49,
      fats: 3.2,
      calories: 265,
      user: User.first
    },
    {
      name: "Carrots",
      quantity: 6,
      expiry_date: Date.today + 2,
      expected_lifetime: 2,
      nutri_score: "A",
      protein: 0.9,
      carbs: 10,
      fats: 0.2,
      calories: 41,
      user: User.first
    },
    {
      name: "Milk",
      quantity: 2,
      expiry_date: Date.today + 1,
      expected_lifetime: 1,
      nutri_score: "C",
      protein: 3.4,
      carbs: 4.8,
      fats: 3.3,
      calories: 61,
      user: User.first
    },
    {
      name: "Chicken Breast",
      quantity: 1,
      expiry_date: Date.today + 10,
      expected_lifetime: 10,
      nutri_score: "C",
      protein: 31,
      carbs: 0,
      fats: 3.6,
      calories: 165,
      user: User.first
    },
    {
      name: "Eggs",
      quantity: 18,
      expiry_date: Date.today + 14,
      expected_lifetime: 14,
      nutri_score: "B",
      protein: 13,
      carbs: 1.1,
      fats: 11,
      calories: 155,
      user: User.first
    },
    {
      name: "Rice",
      quantity: 50,
      expiry_date: Date.today - 1,
      expected_lifetime: 0,
      nutri_score: "A",
      protein: 2.7,
      carbs: 28,
      fats: 0.3,
      calories: 130,
      user: User.first
    },
    {
      name: "Bananas",
      quantity: 6,
      expiry_date: Date.today + 2,
      expected_lifetime: 2,
      nutri_score: "A",
      protein: 1.3,
      carbs: 23,
      fats: 0.3,
      calories: 96,
      user: User.first
    },
    {
      name: "Yogurt",
      quantity: 4,
      expiry_date: Date.today + 6,
      expected_lifetime: 6,
      nutri_score: "B",
      protein: 10,
      carbs: 3.6,
      fats: 0.4,
      calories: 59,
      user: User.first
    },
    {
      name: "Cheddar Cheese",
      quantity: 1,
      expiry_date: Date.today + 15,
      expected_lifetime: 15,
      nutri_score: "C",
      protein: 25,
      carbs: 1.3,
      fats: 33,
      calories: 402,
      user: User.first
    },
    {
      name: "Tomatoes",
      quantity: 8,
      expiry_date: Date.today + 3,
      expected_lifetime: 3,
      nutri_score: "A",
      protein: 0.9,
      carbs: 3.9,
      fats: 0.2,
      calories: 18,
      user: User.first
    },
    {
      name: "Potatoes",
      quantity: 20,
      expiry_date: Date.today + 15,
      expected_lifetime: 15,
      nutri_score: "B",
      protein: 2,
      carbs: 17,
      fats: 0.1,
      calories: 77,
      user: User.first
    },
    {
      name: "Pasta",
      quantity: 5,
      expiry_date: Date.today + 30,
      expected_lifetime: 30,
      nutri_score: "B",
      protein: 5,
      carbs: 25,
      fats: 1.1,
      calories: 131,
      user: User.first
    },
    {
      name: "Salmon Fillet",
      quantity: 2,
      expiry_date: Date.today + 4,
      expected_lifetime: 4,
      nutri_score: "B",
      protein: 20,
      carbs: 0,
      fats: 13,
      calories: 206,
      user: User.first
    }
    # Add the rest of the items with similar structure.

]

# Create records in the database
food_items.each do |item|
  FoodItem.create!(item)
end
