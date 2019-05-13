class UsersController < ApplicationRecord
  def new
    @user = User.new 
  end
  def create
  end
end
