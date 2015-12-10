class RecipesController < ApplicationController
  def home
  end

  def about
  end

	def index
		@recipes = Recipe.find
	end

	def create
		@recipe = Recipe.new(recipe_params)

		if @recipe.save
			redirect_to @recipe
		else
			redirect_to new_recipe_path
		end
	end

	def new
	end

	def edit
	end

	def show
	end

	def update
	end

	def destroy
	end

	private
	def recipe_params
		params.require(:recipe).permit(:title, :course, :main_ingredient, :source, :description, :ingredients, :directions, :prep_time, :cook_time, :total_time, :servings)
	end

end
