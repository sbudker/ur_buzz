class AttendsController < ApplicationController
	# User must be logged in to use these methods
  before_action :logged_in_user

  # Creates an attend relationship between a user and an event
	def create
		event = Micropost.find(params[:attending_id])
    	current_user.attend(event)
    	redirect_to :back 
	end

	# Deletes an attend relationship between a user and an event
	def destroy
		event = Micropost.find(params[:attending_id])
    	current_user.unattend(event)
    	redirect_to :back
	end
end