class AttendsController < ApplicationController

	def create
		@event = Micropost.find(params[:attending_id])
    	current_user.attend(@event)
    	respond_to do |format|
      		format.html { redirect_to @event }
      		format.js 
    	end
	end

	def destroy
		@event = Micropost.find(params[:attending_id])
    	current_user.unattend(@event)
    	respond_to do |format|
      		format.html { redirect_to @event}
      		format.js 
      end
	end
end