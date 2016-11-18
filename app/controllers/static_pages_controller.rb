class StaticPagesController < ApplicationController

  #actions have a correspoding view of the same name
  #code within the action will generally create variables for 
  #use in the view or tell the viewwhat to do
  
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
