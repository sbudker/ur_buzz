class MicropostsController < ApplicationController

	# User must be logged in to use these methods
	before_action :logged_in_user, only: [:create, :destroy, :edit]
	# User must be owner of post in order to access these methods
	before_action :correct_user,   only: [:destroy, :edit]

	# Creates an instance of a micropost
	def create
		@micropost = current_user.microposts.build(micropost_params)
		if @micropost.save
			flash[:success] = "Micropost created!"
			redirect_to root_url
		else
			@feed_items = []
			render 'static_pages/home'
		end
	end

	# Redirects to edit form for the selctected micropost
	def edit
		@micropost = Micropost.find(params[:id])
	end

	# Updates the micropost in the database or redirects back to edit
	def update
		@micropost = Micropost.find(params[:id])
		if @micropost.update_attributes(micropost_params)
			redirect_back_or root_url
		else
			render 'edit'
		end
	end

	# Destroys the selected micropost
	def destroy
		@micropost.destroy
		flash[:success] = "Micropost deleted"
		redirect_to request.referrer || root_url
	end

	# Redirects user to the show_attendee page of the selected micropost
	def attendee
		@title = "Attendees"
		@micropost = Micropost.find(params[:id])
		@people = @micropost.attendee.paginate(page: params[:page])
		render 'show_attendee'
	end

	private

	# The required and permitted parameters for a message
	def micropost_params
		params.require(:micropost).permit(:content, :picture, :eventDate, :location)
	end

	# Verifies if the micropost belongs to the current user
	def correct_user
		@micropost = current_user.microposts.find_by(id: params[:id])
		redirect_to root_url if @micropost.nil?
	end
end