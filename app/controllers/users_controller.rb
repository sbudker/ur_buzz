class UsersController < ApplicationController

  #condition must be met before a corresponding action is triggered
  before_action :logged_in_user, only: [:index, :edit, :update, :destroy, :following, :followers]
  before_action :correct_user,   only: [:edit, :update]
  before_action :admin_user,     only: :destroy

  #divides all users into pages using .paginate method from will_paginate gem
  #this data is available to the users/index view
  def index
    @users = User.paginate(page: params[:page])
  end

  #creates an instance of the user model
  def new
    @user = User.new
  end

  #will show the logged in user along with all of their microposts
  def show
    @user = User.find(params[:id])
    @microposts = @user.microposts.paginate(page: params[:page])
  end

  #will create the user if the parameters entered are correct
  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "Thanks for signing up!"
      redirect_to user_url(@user)
    else
      render 'new'
    end
  end

  #renders logged in user and leads to view which allows user to change their information
  def edit
    @user = User.find(params[:id])
  end

  #action that makes changes to the user's information
  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render 'edit'
    end
  end

  #will delete user from database
  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User deleted"
    redirect_to users_url
  end

  #action that paginates the users that the current user follows
  def following
    @title = "Following"
    @user  = User.find(params[:id])
    @users = @user.following.paginate(page: params[:page])
    render 'show_follow'
  end

  #action that paginates the current user;s followers
  def followers
    @title = "Followers"
    @user  = User.find(params[:id])
    @events = @user.followers.paginate(page: params[:page])
    render 'show_follow'
  end

  def attending
    @title = "Attending"
    @user = User.find(params[:id])
    @events = @user.attending.paginate(page: params[:page])
    render 'show_attending'
  end
  helper_method :attending

  private

    #required parameters for a user
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end

    # Before filters

    # Confirms the correct user.
    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end

    # Confirms an admin user.
    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end

end
