class RecipesController < ApplicationController
  def home
  end
  def about
  end
	def index
	end
	def create
		render plain: params[:recipe].inspect
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
end
