class UsersController < ApplicationController
  def new
    if @user = current_user
      redirect_to restaurants_path
    else
      @user = User.new
    end
  end

  def create
    @user = User.new(user_params)
    if @user.save && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect_to restaurants_path
    else
      flash[:notice] = @user.errors.full_messages
      render :new
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :username, :password, :avatar_url, :email, :uid, :provider, :oauth_token, :google_token, :google_refresh_token, :token, :secret, :profile_image)
  end
end
