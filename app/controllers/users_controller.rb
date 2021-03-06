class UsersController < ApplicationController
  before_filter :signed_in_user, only: [:index, :edit, :update]
  before_filter :correct_user, only: [:edit, :update]
  before_filter :admin_user, only: :destroy

  def new
	@user = User.new
  end

  def index
	@users = User.paginate(page: params[:page])
	#@users = User.all
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

  def update 
	@user = User.find(params[:id])
	if @user.update_attributes(params[:user])
      # Handle a succesful update	  
	  flash[:success] = "Profile Update"
	  sign_in @user
	  redirect_to @user
	else
		render 'edit'
	end
  end	
 
  def show
    @user = User.find(params[:id])
	@micro_posts = @user.micro_posts.paginate(page: params[:page])
  end
  
  def edit
	@user = User.find(params[:id])
  end		

  private
    def correct_user
	  @user = User.find(params[:id])
	  redirect_to(root_path) unless current_user?(@user)	
	end

	def admin_user
		@user = User.find(params[:id])
		redirect_to(root_path) unless current_user.admin?
	end
  
end
