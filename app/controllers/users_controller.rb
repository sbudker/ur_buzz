class UsersController < ApplicationController

  # User must be logged in to use these specified methods
  before_action :logged_in_user, only: [:index, :edit, :update, :destroy, :following, :followers]
  # User must be the current user in order to access these methods
  before_action :correct_user,   only: [:edit, :update]
  # User must be an admin to delete user accounts
  before_action :admin_user,     only: :destroy

  # Renders the paginated users index page
  def index
    @users = User.paginate(page: params[:page])
  end

  # Creates an instance of the user model
  def new
    @user = User.new
  end

  # Show the logged in user along with all of their microposts
  def show
    @user = User.find(params[:id])
    @microposts = @user.microposts.paginate(page: params[:page])
  end

  # Creates a new user with user params
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

  # Renders and prefills user edit form
  def edit
    @user = User.find(params[:id])
  end

  # Upadates user's information in the database
  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render 'edit'
    end
  end
  
  # Deletes user from database
  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User deleted"
    redirect_to users_url
  end

  # Renders the paginated user's follow page
  def following
    @title = "Following"
    @user  = User.find(params[:id])
    @users = @user.following.paginate(page: params[:page])
    render 'show_follow'
  end

  # Renders the paginated user's followers page
  def followers
    @title = "Followers"
    @user  = User.find(params[:id])
    @users = @user.followers.paginate(page: params[:page])
    render 'show_follow'
  end

  # Renders the paginated user's attending page
  def attending
    @title = "Attending"
    @user = User.find(params[:id])
    @events = @user.attending.paginate(page: params[:page])
    render 'show_attending'
  end
  helper_method :attending

  private

    # Required and permitted parameters for a user
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
