class MicropostsController < ApplicationController
	before_action :logged_in_user, only: [:create, :destroy, :edit]
	before_action :correct_user,   only: [:destroy, :edit]

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

	def edit
		@micropost = Micropost.find(params[:id])
	end

	def update
	   @micropost = Micropost.find(params[:id])
    if @micropost.update_attributes(micropost_params)
      redirect_back_or root_url
    else
      render 'edit'
    end
  end

	def attendee
		@title = "Attendees"
    	@micropost = Micropost.find(params[:id])
    	@people = @micropost.attendee.paginate(page: params[:page])
		render 'show_attendee'
	end

	def destroy
		@micropost.destroy
		flash[:success] = "Micropost deleted"
		redirect_to request.referrer || root_url
	end

	private

	def micropost_params
		params.require(:micropost).permit(:content, :picture, :eventDate, :location)
	end

	def correct_user
		@micropost = current_user.microposts.find_by(id: params[:id])
		redirect_to root_url if @micropost.nil?
	end
end