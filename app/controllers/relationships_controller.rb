class RelationshipsController < ApplicationController
	before_action :logged_in_user

	# Creates a follow relationship between two users
	def create
		@user = User.find(params[:followed_id])
		current_user.follow(@user)
		respond_to do |format|
			format.html { redirect_to @user }
			format.js
		end
	end

	# Deletes a follow relationship between two users
	def destroy
		@user = Relationship.find(params[:id]).followed
		current_user.unfollow(@user)
		respond_to do |format|
			format.html { redirect_to @user }
			format.js
		end
	end

end
