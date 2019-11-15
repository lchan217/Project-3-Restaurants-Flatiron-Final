class SessionsController < ApplicationController
  def home
    if @user = current_user
      redirect_to restaurants_path
    end
  end
  def new
  end

  def github_create
    if auth_hash = request.env["omniauth.auth"]
      @user = User.from_github_omniauth(auth_hash)
      if @user.save
        session[:user_id] = @user.id
        redirect_to restaurants_path
      else
        flash[:notice] = "Account doesn't exist or is already registered. Please try again."
        redirect_to root_path
      end
    end
  end

  def google_create
      # Get access tokens from the google server
      if access_token = request.env["omniauth.auth"]
        user = User.from_google_omniauth(access_token)
        if user.save
          # Access_token is used to authenticate request made from the rails application to the google server
          user.google_token = access_token.credentials.token
          # Refresh_token to request new access_token
          # Note: Refresh_token is only sent once during the first request
          refresh_token = access_token.credentials.refresh_token
          user.google_refresh_token = refresh_token if refresh_token.present?
          user.save
          redirect_to restaurants_path
        else
          flash[:notice] = "Account doesn't exist or is already registered. Please try again."
          redirect_to root_path
        end
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
