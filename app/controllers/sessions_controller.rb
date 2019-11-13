class SessionsController < ApplicationController
  def home
    if @user = current_user
      redirect_to restaurants_path
    end
  end

  def new
  end

  def omni_create
    if auth_hash = request.env["omniauth.auth"]
      @user_from_github = User.from_github_omniauth(auth_hash)
      @user_from_google = User.from_google_omniauth(auth_hash)
      if @user_from_github
        session[:user_id] = @user_from_github.id
        redirect_to restaurants_path
      end
      if @user_from_google
        log_in(@user_from_google)
        @user_from_google.google_token = access_token.credentials.token
        refresh_token = access_token.credentials.refresh_token
        @user_from_google.google_refresh_token = refresh_token if refresh_token.present?
        @user_from_google.save
        redirect_to restaurants_path
      end
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
