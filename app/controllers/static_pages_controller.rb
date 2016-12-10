class StaticPagesController < ApplicationController

  # Render correct home page for logged in user or non authenticated user
  def home
  	if logged_in?
  		@micropost = current_user.microposts.build
  		@feed_items = current_user.search(params[:search]).paginate(page: params[:page])
  	end
  end

  # Renders help page
  def help
  end

  # Renders about page
  def about
  end

  # Renders contact page
  def contact
  end

end
