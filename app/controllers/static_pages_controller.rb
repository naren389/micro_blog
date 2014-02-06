
class StaticPagesController < ApplicationController
  def home
	@micro_post = current_user.micro_posts.build if signed_in?
	@feed_items = current_user.feed.paginate(page: params[:page]) if signed_in?
  end

  def help
  end
end
