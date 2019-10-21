class RestaurantsController < ApplicationController
  before_action :require_login
  skip_before_action :verify_authenticity_token

  def index
    all_restaurants = current_user.restaurants.uniq
    @restaurants = all_restaurants.sort_by {|r| r.name.downcase}
    respond_to do |format|
      format.html {render :index}
      format.json {render json: @restaurants}
    end
  end

  def show
    @restaurant = Restaurant.find(params[:id])
    respond_to do |format|
      format.html {render :show}
      format.json {render json: @restaurant}
    end
  end

  def new
    @restaurant = Restaurant.new
    @restaurant.locations.build
    @user = current_user
  end

  def create
    @user = current_user
    @restaurant = Restaurant.new(restaurant_params)
    @restaurants = current_user.restaurants.uniq
    if @restaurant.save
      render json: @restaurant, status: 201
    else
      render :new
    end
  end

  def edit
    restaurants = current_user.restaurants.uniq
    result = restaurants.select { |r|  r.id == params[:id].to_i  }
    if result == []
      redirect_to restaurants_path
    else
      @restaurant = Restaurant.find(params[:id])
      @user = current_user
    end
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
