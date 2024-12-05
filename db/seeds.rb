# # This file should ensure the existence of records required to run the application in every environment (production,
# # development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# # The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
# #
# # Example:
# #
# #   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
# #     MovieGenre.find_or_create_by!(name: genre_name)
# #   end

# # db/seeds.rb

# # db/seeds.rb

# # Clear existing data to avoid duplication
# FoodItem.destroy_all
# User.destroy_all

# user = User.new(email: "a@a.a", password: "123456")
# user.save

# # Seed data for FoodItem
# food_items = [

#     {
#       name: "Apple",
#       quantity: 5,
#       expiry_date: Date.today + 4,
#       expected_lifetime: 4,
#       nutri_score: "A",
#       protein: 0.3,
#       carbs: 14,
#       fats: 0.2,
#       calories: 52,
#       user: User.first
#     },
#     {
#       name: "Bread",
#       quantity: 1,
#       expiry_date: Date.today + 13,
#       expected_lifetime: 13,
#       nutri_score: "B",
#       protein: 9,
#       carbs: 49,
#       fats: 3.2,
#       calories: 265,
#       user: User.first
#     },
#     {
#       name: "Carrots",
#       quantity: 6,
#       expiry_date: Date.today + 2,
#       expected_lifetime: 2,
#       nutri_score: "A",
#       protein: 0.9,
#       carbs: 10,
#       fats: 0.2,
#       calories: 41,
#       user: User.first
#     },
#     {
#       name: "Milk",
#       quantity: 2,
#       expiry_date: Date.today + 1,
#       expected_lifetime: 1,
#       nutri_score: "C",
#       protein: 3.4,
#       carbs: 4.8,
#       fats: 3.3,
#       calories: 61,
#       user: User.first
#     },
#     {
#       name: "Chicken Breast",
#       quantity: 1,
#       expiry_date: Date.today + 10,
#       expected_lifetime: 10,
#       nutri_score: "C",
#       protein: 31,
#       carbs: 0,
#       fats: 3.6,
#       calories: 165,
#       user: User.first
#     },
#     {
#       name: "Eggs",
#       quantity: 18,
#       expiry_date: Date.today + 14,
#       expected_lifetime: 14,
#       nutri_score: "B",
#       protein: 13,
#       carbs: 1.1,
#       fats: 11,
#       calories: 155,
#       user: User.first
#     },
#     {
#       name: "Rice",
#       quantity: 50,
#       expiry_date: Date.today - 1,
#       expected_lifetime: 0,
#       nutri_score: "A",
#       protein: 2.7,
#       carbs: 28,
#       fats: 0.3,
#       calories: 130,
#       user: User.first
#     },
#     {
#       name: "Bananas",
#       quantity: 6,
#       expiry_date: Date.today + 2,
#       expected_lifetime: 2,
#       nutri_score: "A",
#       protein: 1.3,
#       carbs: 23,
#       fats: 0.3,
#       calories: 96,
#       user: User.first
#     },
#     {
#       name: "Yogurt",
#       quantity: 4,
#       expiry_date: Date.today + 6,
#       expected_lifetime: 6,
#       nutri_score: "B",
#       protein: 10,
#       carbs: 3.6,
#       fats: 0.4,
#       calories: 59,
#       user: User.first
#     },
#     {
#       name: "Cheddar Cheese",
#       quantity: 1,
#       expiry_date: Date.today + 15,
#       expected_lifetime: 15,
#       nutri_score: "C",
#       protein: 25,
#       carbs: 1.3,
#       fats: 33,
#       calories: 402,
#       user: User.first
#     },
#     {
#       name: "Tomatoes",
#       quantity: 8,
#       expiry_date: Date.today + 3,
#       expected_lifetime: 3,
#       nutri_score: "A",
#       protein: 0.9,
#       carbs: 3.9,
#       fats: 0.2,
#       calories: 18,
#       user: User.first
#     },
#     {
#       name: "Potatoes",
#       quantity: 20,
#       expiry_date: Date.today + 15,
#       expected_lifetime: 15,
#       nutri_score: "B",
#       protein: 2,
#       carbs: 17,
#       fats: 0.1,
#       calories: 77,
#       user: User.first
#     },
#     {
#       name: "Pasta",
#       quantity: 5,
#       expiry_date: Date.today + 30,
#       expected_lifetime: 30,
#       nutri_score: "B",
#       protein: 5,
#       carbs: 25,
#       fats: 1.1,
#       calories: 131,
#       user: User.first
#     },
#     {
#       name: "Salmon Fillet",
#       quantity: 2,
#       expiry_date: Date.today + 4,
#       expected_lifetime: 4,
#       nutri_score: "B",
#       protein: 20,
#       carbs: 0,
#       fats: 13,
#       calories: 206,
#       user: User.first
#     }
#     # Add the rest of the items with similar structure.

# ]

# # Create records in the database
# food_items.each do |item|
#   FoodItem.create!(item)
# end


FoodItem.destroy_all



# db/seeds.rb

# Ensure there's at least one user in the database. If User.first is not available, we'll create one.
user = User.first || User.create!(email: 'a@a.a', password: '123456')

# Seeding Food Items with additional attributes: nutri_score, protein, carbs, fats, calories, and expiry_date
# Create food items with downcased nutri_score and dynamic expiration dates

# Create food items with downcased nutri_score and dynamic expiration dates

FoodItem.create!(name: 'Apple', quantity: 10, unit: 'pcs', user: user,
  nutri_score: 'a', protein: 0, carbs: 25, fats: 0, calories: 95, expiry_date: Date.current, image_url: "https://img.freepik.com/free-photo/delicious-red-apples-isolated-white-table_114579-67401.jpg")

FoodItem.create!(name: 'Banana', quantity: 15, unit: 'pcs', user: user,
  nutri_score: 'b', protein: 1, carbs: 27, fats: 0, calories: 105, expiry_date: Date.current + 5.days, image_url: "https://www.bigbasket.com/media/uploads/p/xxl/10000027_32-fresho-banana-robusta.jpg")

FoodItem.create!(name: 'Carrot', quantity: 20, unit: 'pcs', user: user,
  nutri_score: 'a', protein: 1, carbs: 10, fats: 0, calories: 41, expiry_date: Date.current + 3.days, image_url: "https://www.veggycation.com.au/siteassets/veggycationvegetable/carrots.jpg")

FoodItem.create!(name: 'Cucumber', quantity: 12, unit: 'pcs', user: user,
  nutri_score: 'a', protein: 1, carbs: 4, fats: 0, calories: 16, expiry_date: Date.current + 2.days, image_url: "https://wh.farm/wp-content/uploads/2022/09/SlicerCucumber-Featured.jpg")

FoodItem.create!(name: 'Spinach', quantity: 50, unit: 'g', user: user,
  nutri_score: 'a', protein: 3, carbs: 3, fats: 0, calories: 23, expiry_date: Date.current + 4.days, image_url: "https://thefreshandnatural.com/wp-content/uploads/2020/05/SPINACH-BUNCH.jpg")

FoodItem.create!(name: 'Tomato', quantity: 25, unit: 'pcs', user: user,
  nutri_score: 'b', protein: 1, carbs: 5, fats: 0, calories: 22, expiry_date: Date.current + 6.days, image_url: "https://media.post.rvohealth.io/wp-content/uploads/2020/09/AN313-Tomatoes-732x549-Thumb.jpg")

FoodItem.create!(name: 'Lettuce', quantity: 10, unit: 'pcs', user: user,
  nutri_score: 'a', protein: 1, carbs: 3, fats: 0, calories: 15, expiry_date: Date.current + 1.day, image_url: "https://trikaya.net/cdn/shop/products/LettuceLeafytabletop_800x.jpg")

FoodItem.create!(name: 'Milk', quantity: 2, unit: 'L', user: user,
  nutri_score: 'b', protein: 3, carbs: 12, fats: 8, calories: 150, expiry_date: Date.current + 5.days, image_url: "https://images.immediate.co.uk/production/volatile/sites/30/2020/02/Glass-and-bottle-of-milk-fe0997a.jpg")

FoodItem.create!(name: 'Cheese', quantity: 300, unit: 'g', user: user,
  nutri_score: 'c', protein: 20, carbs: 1, fats: 33, calories: 350, expiry_date: Date.current + 30.days, image_url: "https://www.healthyfood.com/wp-content/uploads/2017/03/Guide_to_cheese-1024x851.jpg")

FoodItem.create!(name: 'Yogurt', quantity: 500, unit: 'g', user: user,
  nutri_score: 'b', protein: 5, carbs: 15, fats: 10, calories: 150, expiry_date: Date.current + 4.days, image_url: "https://www.koelln.de/fileadmin/user_upload/joghurt.jpg")

FoodItem.create!(name: 'Rice', quantity: 1000, unit: 'g', user: user,
  nutri_score: 'c', protein: 8, carbs: 80, fats: 0, calories: 360, expiry_date: Date.current + 180.days, image_url: "https://www.mississippivegan.com/wp-content/uploads/2021/12/easy-baked-rice-02.jpg")

FoodItem.create!(name: 'Flour', quantity: 1000, unit: 'g', user: user,
  nutri_score: 'c', protein: 10, carbs: 70, fats: 1, calories: 340, expiry_date: Date.current + 180.days, image_url: "https://www.unlockfood.ca/EatRightOntario/media/Website-images-resized/All-about-grain-flours-resized.jpg")

FoodItem.create!(name: 'Olive Oil', quantity: 1, unit: 'L', user: user,
  nutri_score: 'a', protein: 0, carbs: 0, fats: 100, calories: 884, expiry_date: Date.current + 365.days, image_url: "https://cdn-prod.medicalnewstoday.com/content/images/articles/321/321246/olive-oil-in-a-bottle-which-may-be-used-on-the-face.jpg")

FoodItem.create!(name: 'Butter', quantity: 250, unit: 'g', user: user,
  nutri_score: 'c', protein: 1, carbs: 0, fats: 81, calories: 717, expiry_date: Date.current + 7.days, image_url: "https://cdn.britannica.com/27/122027-050-EAA86783/Butter.jpg")

FoodItem.create!(name: 'Chicken Breast', quantity: 500, unit: 'g', user: user,
  nutri_score: 'a', protein: 31, carbs: 0, fats: 3, calories: 165, expiry_date: Date.current + 3.days, image_url: "https://www.momswhothink.com/wp-content/uploads/2023/05/shutterstock-1915431781-huge-licensed-scaled.jpg")

FoodItem.create!(name: 'Salmon', quantity: 300, unit: 'g', user: user,
  nutri_score: 'b', protein: 22, carbs: 0, fats: 13, calories: 280, expiry_date: Date.current + 6.days, image_url: "https://www.vicsmeat.com.au/cdn/shop/products/ora-king-mid-cut-salmon-160-180g-x-2-pieces-868760.jpg")

FoodItem.create!(name: 'Beef Steak', quantity: 400, unit: 'g', user: user,
  nutri_score: 'c', protein: 26, carbs: 0, fats: 20, calories: 242, expiry_date: Date.current + 2.days, image_url: "https://cdn.shopify.com/s/files/1/0338/9934/8108/files/how-to-tell-if-raw-steak-is-bad-or-spoiled-2_480x480.jpg")

FoodItem.create!(name: 'Eggs', quantity: 12, unit: 'pcs', user: user,
  nutri_score: 'b', protein: 6, carbs: 1, fats: 5, calories: 68, expiry_date: Date.current + 5.days, image_url: "https://5.imimg.com/data5/SELLER/Default/2023/3/XY/QJ/DA/131956719/brown-table-egg-500x500.jpeg")

FoodItem.create!(name: 'Coffee Beans', quantity: 250, unit: 'g', user: user,
  nutri_score: 'a', protein: 10, carbs: 0, fats: 12, calories: 250, expiry_date: Date.current + 365.days, image_url: "https://venezianocoffee.com.au/cdn/shop/articles/How_to_Choose_the_Best_Coffee_Beans_for_Espresso_600x.png")



# Optional: Attach a photo to some of the Food Items (adjust with actual file paths)
# apple_image = Rails.root.join('app', 'assets', 'images', 'apple.jpg')
# banana_image = Rails.root.join('app', 'assets', 'images', 'banana.jpg')

# FoodItem.first.photo.attach(io: File.open(apple_image), filename: 'apple.jpg') if File.exist?(apple_image)
# FoodItem.second.photo.attach(io: File.open(banana_image), filename: 'banana.jpg') if File.exist?(banana_image)

puts "20 food items created successfully!"
