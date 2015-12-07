class UsersController < ApplicationController
	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		if @user.save
			session[:id] = @user.id
			flash[:success] = "User created"
			redirect_to root_path
		else
			flash[:warning] = "There was an error in the submitted data"
			redirect_to new_user_path
		end
	end

	private
	def user_params
		params.require(:user).permit(:first_name, :last_name, :email, :password)
	end
end
