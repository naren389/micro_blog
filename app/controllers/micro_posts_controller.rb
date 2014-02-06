
class MicroPostsController < ApplicationController
  before_filter :signed_in_user, only: [:create, :destroy]
  before_filter :correct_user, only: :destroy	

  def index
  end

  def create
    @micro_post = current_user.micro_posts.build(params[:micro_post])
    if @micro_post.save
		flash[:success] = "MicroPost created !"
		redirect_to current_user
	else
		render 'static_pages/home'
	end
  end
  
  def destroy
	@micro_post.destroy
	redirect_back_or root_path
  end

  private 
    def correct_user
		@micro_post = current_user.micro_posts.find_by_id(params[:id])
	rescue
		redirect_to root_path
    end

end
