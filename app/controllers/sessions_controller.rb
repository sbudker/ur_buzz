class SessionsController < ApplicationController

  # Redirects to the log in page
  def new
  end

  # Creates a session for the authenticated user or redirects to new
  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
      params[:session][:remember_me] == '1' ? remember(user) : forget(user)
      redirect_back_or user
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end

  # Deletes the session/logs out the user
  def destroy
    log_out if logged_in?
    redirect_to root_url
  end
end