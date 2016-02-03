class SessionsController < ApplicationController
  def new
  end

  def create
  	user = User.find_by(email: params[:session][:email].downcase)
  	if user && user.authenticate(params[:session][:password])
  		log_in(user)
  		redirect_to recipes_path
  		#log the use in and redirect to recipe index
  	else
  		# Display error message and route to 'new user page'
  		flash.now[:danger] = "Invalid email/password combination"
  		redirect_to root_path
   	end
  end

  def destroy
    log_out
    redirect_to root_path
  end
end
