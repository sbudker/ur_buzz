class AttendsController < ApplicationController
	# User must be logged in to use these methods
	before_action :logged_in_user

  # Creates an attend relationship between a user and an event
  def create
  	@micropost = Micropost.find(params[:attending_id])
  	current_user.attend(@micropost)
  	respond_to do |format|
  		format.html { redirect_to :back }
  		format.js
  	end 
  end

	# Deletes an attend relationship between a user and an event
	def destroy
		@micropost = Micropost.find(params[:attending_id])
		current_user.unattend(@micropost)
		respond_to do |format|
			format.html { redirect_to :back }
			format.js
		end
	end
end