class RestaurantsController < ApplicationController
  before_action :require_login
  skip_before_action :verify_authenticity_token

  def index
    @restaurants = current_user.restaurants.uniq
    respond_to do |f|
			f.html {render :index}
			f.json {render json: @restaurants}
		end
  end

  def show
    @restaurant = Restaurant.find(params[:id])
    respond_to do |f|
			f.html {render :show}
			f.json {render json: @restaurant}
		end
  end

  def new
    @restaurant = Restaurant.new
    @restaurant.locations.build
    @user = current_user

  end

  def create  
    @restaurant = Restaurant.new(restaurant_params)
    if @restaurant.save
      render json: @restaurant, status: 201
    else
      render :new
    end
  end

  def edit
    @restaurant = Restaurant.find(params[:id])
    @user = current_user
  end

  def update
    @restaurant = Restaurant.find(params[:id])
    @user = current_user
    if @restaurant.update(restaurant_params)
      redirect_to restaurant_path(@restaurant)
    else
      render :edit
    end
  end

  def destroy
    Location.find_by(restaurant_id: params[:id]).destroy
    Restaurant.find(params[:id]).destroy
    redirect_to restaurants_path
  end

  private
  def restaurant_params
    params.require(:restaurant).permit(:name, :price_range, :reservations, :query_search, :query_existing, :parking, :wifi, :city, :state, :occasion, :takeS_reservations, :location_id, :rating, :comment, locations_attributes: [:city, :state, :user_id])
  end
end
