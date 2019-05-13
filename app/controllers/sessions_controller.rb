class SessionsController < ApplicationController
  def new
  end

  def create
    if auth_hash = request.env["omniauth.auth"]
      github_email = request.env["omniauth.auth"]["email"]
      user = User.find_by(email: github_email)
      redirect_to user_path(user)
    else
      user = User.find_by(username: params[:user][:username])
      if user && user.authenticate(params[:user][:password])
        session[:user_id] = user.id
        redirect_to user_path(user)
      elsif user == nil
        flash[:notice] = "User not found. Please try again. "
        redirect_to '/auth/:provider/callback'
      else
        flash[:notice] = "There was a problem authenticating your password. Please try again. "
        redirect_to '/auth/:provider/callback'
      end
    end
  end

 def destroy
   reset_session
   redirect_to root_path
 end
end
