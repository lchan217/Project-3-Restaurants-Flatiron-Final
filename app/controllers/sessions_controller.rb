class SessionsController < ApplicationController
  def home
  end
  def new
  end

  def github_create
    if auth_hash = request.env["omniauth.auth"]
      @user = User.from_omniauth(auth_hash)
      session[:user_id] = @user.id
      redirect_to restaurants_path
    else
      redirect_to root_path
    end
  end

  def create
      @user = User.find_by(username: params[:user][:username])
      if @user && @user.authenticate(params[:user][:password])
        session[:user_id] = @user.id
        redirect_to restaurants_path
      elsif @user == nil
        flash[:notice] = "User not found. Please try again."
        redirect_to root_path
      else
        flash[:notice] = "There was a problem authenticating your password. Please try again."
        redirect_to root_path
      end
    end

   def destroy
     reset_session
     redirect_to root_path
   end
 end
