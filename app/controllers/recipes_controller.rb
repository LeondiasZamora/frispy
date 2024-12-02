class RecipesController < ApplicationController
  def index
    @recipes = current_user.recipes
  end

  def create
    instructions_array = []
    params["instructions"].map do |instruction|
      instruction["display_text"]
    end
    nutrition = params[:nutrition]
    pp nutrition[:calories]
    @recipe = Recipe.new(
      name: params[:name],
      instructions: instructions_array.join,
      fat: nutrition["fat"],
      sugar: nutrition["sugar"],
      calories: nutrition["calories"],
      preparation_time: params["prep_time_minutes"],
      image: params["thumbnail_url"],
      user: current_user
      )

    if @recipe.save
      pp "Recipe saved successfully"
    else
      pp "did not work, try again"
    end
    redirect_to recipes_path, notice: "Recipe was saved to your favourites ❤️"
  end

  def show

  end

  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy

    redirect_to recipes_path, notice: "food item deleted successfully. "
  end

end
