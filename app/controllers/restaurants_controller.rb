class RestaurantsController < ApplicationController
  before_action :require_login

  def index
    @restaurants = current_user.restaurants.uniq
  end

  def show
    @restaurant = Restaurant.find(params[:id])
  end

  def new
    @restaurant = Restaurant.new
    @restaurant.locations.build
    @restaurant.locations.build
    @user = current_user
  end

  def create
    @user = current_user
    @restaurant = Restaurant.new(restaurant_params)
    #need to refactor somehow
    @restaurant.city = params[:restaurant][:locations_attributes].values.first.values[0]
    @restaurant.state = params[:restaurant][:locations_attributes].values.first.values[1]

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

  def all_restaurants_in_db
    if params[:query_search] && params[:query_existing] == ""
      @restaurants = Restaurant.search(params[:query_search])
    elsif params[:query_existing] && params[:query_search] == ""
      @restaurants = Restaurant.search(params[:query_existing])
    else
      @restaurants = Restaurant.all
    end
    render 'all_restaurants_in_db'
  end

  private
  def restaurant_params
    params.require(:restaurant).permit(:name, :price_range, :reservations, :query_search, :query_existing, :parking, :wifi, :city, :state, :occasion, :takeS_reservations, :location_id, :rating, :comment, locations_attributes: [:city, :state, :user_id])
  end
end
