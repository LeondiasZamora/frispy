require 'uri'
require 'net/http'
require "json"
require "open-uri"

class FoodItemsController < ApplicationController
  before_action :set_food_item, only: %i[show edit update destroy recipes]
  before_action :authenticate_user!

  def index
    user_items = FoodItem.where(user_id: current_user)
    if params[:query].present?
      food_list = user_items.where("name ILIKE ?", "%#{params[:query]}%")
    else
      food_list = user_items
    end
    @food_items = food_list.sort_by(&:expiry_date)
  end

  def show
    @food_item = FoodItem.find(params[:id])
    # response = HTTP.get("https://api.example.com/food_items/1")
    # @food_item = response.parse(:json) # Parse API response into a hash
    # @image_url = @food_item["image_url"] # Assuming the API returns an 'image_url' key
    @food_items = current_user.food_items.order(expiry_date: :asc, created_at: :asc)
  end

  def new
    @food_item = FoodItem.new
  end

  def recipes
    # urgent_food_items = FoodItem.where(expiry_date: Date.today)
    # @food_item = FoodItem.find(params[:id])
    @food_item = FoodItem.find(params[:id])

    url = "https://tasty.p.rapidapi.com/recipes/list?from=0&size=10&q="
    url += @food_item.name

    # urgent_food_items.each do |item|
    #   url += "%2C%20#{item.name}"
    # end

    new_url = URI(url)
    http = Net::HTTP.new(new_url.host, new_url.port)
    http.use_ssl = true

    request = Net::HTTP::Get.new(new_url)
    request["x-rapidapi-key"] = '7742a48828msh02c98e073429450p12b25cjsn1fb00543e799'
    request["x-rapidapi-host"] = 'tasty.p.rapidapi.com'

    response = http.request(request)
    data = response.read_body
    @recipes = JSON.parse(data)
  end

  def create
    @food_item = FoodItem.new(food_item_params)
    @food_item.user = current_user
    if @food_item.save
      redirect_to food_items_path, notice: "Food item added successfully."
    else
      render :new, status: :unprocessable_entity
    end
    query = @food_item.name
    url ="https://api.calorieninjas.com/v1/nutrition?query="
    api_key = "ENcN8AvX6lEDkY0gaXLeUg==iAhCC694M9GYfD04"
  end

  def edit

  end

  def update
    if @food_item.update(food_item_params)
      redirect_to food_items_path, notice: "Food item updated successfully."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @food_item.destroy
    redirect_to food_items_path, notice: "Food item deleted successfully."
  end

  private

  def set_food_item
    @food_item = current_user.food_items.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to food_items_path
  end

  def food_item_params
    params.require(:food_item).permit(:name, :quantity, :expiry_date)
  end
end
