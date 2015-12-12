class RecipesController < ApplicationController
  def home
  end

  def about
  end

	def nav_search
		if !params[:query].present?
			redirect_to :back
		else
			@recipes = Recipe.search(params[:query])
			if !@recipes.present?
					flash[:warning] = "No recipes found"
					redirect_to :back
			else
				render "index"
			end
		end
	end


# index action responsive to search queries - could be used for keyword nav search
#  as well as course search from homepage
#	def index
#		if params[:query].present?
#			@recipes = Recipe.search(params[:query])
#			if !@recipes.present?
#				flash[:warning] = "No recipes found"
#				redirect_to :back
#			end
#		else
#			@recipes =  Recipe.all
#		end
#	end


# working index action - but not responsive to search parameters
	def index
		@recipes = Recipe.all
	end

	def create
		@recipe = Recipe.new(recipe_params)

		if @recipe.save
			redirect_to @recipe
		else
			flash[:warning] = "Recipe save failed"
			redirect_to new_recipe_path
		end
	end

	def new
		@recipe = Recipe.new
	end

	def edit
		@recipe = Recipe.find(params[:id])
	end

	def show
		@recipe = Recipe.find(params[:id])
	end

	def update
		@recipe = Recipe.find(params[:id])
		if @recipe.update(recipe_params)
			redirect_to recipe_path
		else
			render 'edit'
		end
	end

	def destroy
		@recipe = Recipe.find(params[:id])
		@recipe.destroy
		flash[:success] = "#{@recipe.title} - was deleted successfully"
		redirect_to recipes_path	# back to the list

	end

	def course
		@recipes = Recipe.where("course = ?", params[:course])
		#render plain: @recipes
		unless !@recipes.blank?
			flash[:warning] = "No #{params[:course]} recipes found"
			redirect_to root_path
		end
	end

	private
	def recipe_params
		params.require(:recipe).permit(:title, :course, :main_ingredient, :source, :description, :ingredients, :directions, :prep_time, :cook_time, :total_time, :servings)
	end

end
