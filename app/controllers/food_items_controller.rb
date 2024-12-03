require 'uri'
require 'net/http'
require "json"
require "open-uri"
require 'rest-client'
require 'base64'

class FoodItemsController < ApplicationController
  before_action :set_food_item, only: %i[show edit update destroy recipes_api]
  before_action :authenticate_user!
  before_action :set_food_item, only: [:consume, :donate, :expire]

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

  def recipes_api
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
    request["x-rapidapi-key"] = ENV["RECIPES_API_KEY"]
    request["x-rapidapi-host"] = 'tasty.p.rapidapi.com'

    response = http.request(request)
    data = response.read_body
    @recipes = JSON.parse(data)
  end

  def create

    @food_item = FoodItem.new(food_item_params)
    @food_item.user = current_user


    #Api call to the imagga api for image recognition


    ## here we make the api call to the unsplash api in order to get an image
    # unsplash_api_key = ENV["UNSPLASH_API_KEY"]
    # unsplash_api_base_url = "https://api.unsplash.com/search/photos"

    # unsplash_api_url = "#{unsplash_api_base_url}?query=#{URI.encode_www_form_component(query)}&client_id=#{unsplash_api_key}"

    # unsplash_response = URI.open(unsplash_api_url).read
    # image_data = JSON.parse(unsplash_response)

    # #updating the @food_item with the image url we got back
    # @food_item.update(image_url: image_data["results"][0]["urls"]["thumb"])

    if @food_item.save
      image_path = @food_item.photo.key
      api_key = ENV["API_KEY"]
      api_secret = ENV["API_SECRET"]

      sleep(5)
      auth = 'Basic ' + Base64.strict_encode64( "#{api_key}:#{api_secret}" ).chomp
      pp auth
      pp image_path
      api_item_name = RestClient.get("https://api.imagga.com/v2/tags?image_url=https://res.cloudinary.com/dsc3ysvjs/image/upload/v1733155758/development/#{image_path}.jpg", { :Authorization => auth })
      # api_item_name = RestClient.get("https://api.imagga.com/v2/tags?image_url=https://res.cloudinary.com/dsc3ysvjs/image/upload/v1733220332/production/#{image_path}.jpg", { :Authorization => auth })

      item_name = JSON.parse(api_item_name.body)["result"]["tags"][0]["tag"]["en"]
      pp item_name
      @food_item.update(name: item_name)
      # Api call to get the nutritional values is made here :
      query = item_name
      url = "https://api.calorieninjas.com/v1/nutrition?query="
      api_key = ENV["NUTRITION_API_KEY"]

      response = URI.open(url + query, "X-Api-Key" => api_key)
      if response
        data = JSON.parse(response.read)
      else
        puts "An error occurred while making the API request."
      end

      #updating the @food_item with the values we get from the api:
      @food_item.update(calories: data["items"][0]["calories"])
      @food_item.update(protein: data["items"][0]["protein_g"])
      @food_item.update(fats: data["items"][0]["fat_total_g"])
      @food_item.update(carbs: data["items"][0]["carbohydrates_total_g"])
      redirect_to food_items_path, notice: "Food item added successfully."
    else
      render :new, status: :unprocessable_entity
    end

  end

  def edit
  end

  def rewards
  end

  def update
    if @food_item.update(food_item_params)
      redirect_to food_items_path, notice: "Food item updated successfully."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy

    # Test code salman start
    @food_item = FoodItem.find(params[:id])
    if @food_item.expiry_date < Date.today
      # Deduct points for expired item
      current_user.decrement!(:score, @food_item.quantity) # 1 point per expired item
      flash[:notice] = "Expired item removed. Points deducted."
    else
      # Add points for consumed item
      current_user.increment!(:score, @food_item.quantity) # 1 point per consumed item
      flash[:notice] = "Item consumed successfully! Points added."
    end
    # Test code salman end

    @food_item.destroy
    pp "destroy!!"
    redirect_to food_items_path, notice: params[:notice]
  end


# Test code salman start
  def consume
    # Update score for consumed food item (e.g., add points to consumed_score)
    current_user.increment!(:consumed_score, @food_item.quantity)
    current_user.increment!(:score, @food_item.quantity)  # Total score includes consumed items

    # Update food item as consumed (e.g., mark as consumed)
    @food_item.update(status: "consumed")

    # Respond with Turbo Stream to update the total score on the page
    respond_to do |format|
      format.turbo_stream do
        render turbo_stream: [
          turbo_stream.update("total-score", partial: "shared/total_score", locals: { user: current_user }),
          turbo_stream.update("consumed-score", partial: "shared/consumed_score", locals: { user: current_user }),
          turbo_stream.remove(dom_id(@food_item))
        ]
      end
    end
  end
# Test code salman start
  def donate
    # Update score for donated food item (e.g., add points to charity_score)
    current_user.increment!(:charity_score, @food_item.quantity)
    current_user.increment!(:score, @food_item.quantity)  # Total score includes charity donations

    # Update food item as donated
    @food_item.update(status: "donated")

    # Respond with Turbo Stream to update the total score on the page
    respond_to do |format|
      format.turbo_stream do
        render turbo_stream: [
          turbo_stream.update("total-score", partial: "shared/total_score", locals: { user: current_user }),
          turbo_stream.update("charity-score", partial: "shared/charity_score", locals: { user: current_user }),
          turbo_stream.remove(dom_id(@food_item))
        ]
      end
    end
  end
# Test code salman start
  def expire
    # Update score for expired food item (e.g., deduct points from expired_score)
    current_user.decrement!(:expired_score, @food_item.quantity)
    current_user.decrement!(:score, @food_item.quantity)  # Total score includes expired items

    # Update food item as expired
    @food_item.update(status: "expired")

    # Respond with Turbo Stream to update the total score on the page
    respond_to do |format|
      format.turbo_stream do
        render turbo_stream: [
          turbo_stream.update("total-score", partial: "shared/total_score", locals: { user: current_user }),
          turbo_stream.update("expired-score", partial: "shared/expired_score", locals: { user: current_user }),
          turbo_stream.remove(dom_id(@food_item))
        ]
      end
    end
  end


  private

  def set_food_item
    @food_item = FoodItem.find(params[:id])
    @food_item = current_user.food_items.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to food_items_path
  end

  def food_item_params
    params.require(:food_item).permit(:name, :quantity, :unit, :expiry_date, :photo)
  end
end
