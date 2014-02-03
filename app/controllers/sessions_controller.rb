
class SessionsController < ApplicationController
	
	def create
		user = User.find_by_email(params[:session][:email])
		if user && user.authenticate(params[:session][:password])
			# sign the user in and redirect to the user show page
			sign_in user
			redirect_to user
		else
			# Create an error message and re-render the sign in form
			flash.now[:error] = "Invalid Email/Password combination"
			render 'new'
		end
	end

	def new
	end

	def destroy
	end
end
