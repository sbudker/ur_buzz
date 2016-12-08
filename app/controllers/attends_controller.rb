class AttendsController < ApplicationController
  before_action :logged_in_user

	def create
		event = Micropost.find(params[:attending_id])
    	current_user.attend(event)
    	redirect_to :back
	end

	def destroy
		event = Micropost.find(params[:attending_id])
    	current_user.unattend(event)
    	redirect_to :back
	end
end