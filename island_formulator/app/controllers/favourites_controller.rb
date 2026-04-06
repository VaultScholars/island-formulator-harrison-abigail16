class FavouritesController < ApplicationController
  def create
    recipe = Recipe.find(params[:recipe_id])
    current_user.favourites.create(recipe: recipe)
    redirect_to recipe
  end

  def destroy
    favourite = current_user.favourites.find_by(recipe_id: params[:recipe_id])
    favourite.destroy if favourite
    redirect_to Recipe.find(params[:recipe_id])
  end

  def index
    @favourite_recipes = current_user.favourite_recipes
  end
end
