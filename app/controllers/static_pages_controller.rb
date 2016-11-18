class StaticPagesController < ApplicationController
  def home
  	if logged_in?
  		@micropost = current_user.microposts.build
  		@feed_items = current_user.search(params[:search]).paginate(page: params[:page])
  	end
  end

  def help
  end

  def about
  end

  def contact
  end

end
