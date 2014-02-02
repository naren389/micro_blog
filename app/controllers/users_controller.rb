
class UsersController < ApplicationController
  def new
	@user = User.new
  end
  
  def create
	@user = User.new(params[:user])
	if @user.save
		#Handle successful case here
		flash[:success] = "Welcome to the Micro Blog !"
		redirect_to @user
	else
		render 'new'
	end
  end	
	
 
  def show
    @user = User.find(params[:id])
  end
end
