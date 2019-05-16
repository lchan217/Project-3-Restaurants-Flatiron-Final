class RestaurantsController < ApplicationController
  def index
    @restaurants = current_user.restaurants
  end

  def show
    @restaurant = Restaurant.find(params[:id])
  end

  def new
    @restaurant = Restaurant.new
    @restaurant.locations.build
    @user = current_user
  end

  def create
    @user = current_user
    @restaurant = Restaurant.new(restaurant_params)
    if @restaurant.save
      redirect_to restaurants_path
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
    Restaurant.find(params[:id]).destroy
    redirect_to restaurants_path
  end

  private
  def restaurant_params
    params.require(:restaurant).permit(:name, :price_range, :reservations?, :parking, :wifi, :occasion, :takeS_reservations, :location_id, locations_attributes: [:city, :state, :user_id] )
  end
end
