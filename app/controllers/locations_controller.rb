class LocationsController < ApplicationController
  # def index
  #   @locations = Location.all
  # end
  #
  # def new
  #   @location = Location.new
  # end
  #
  # def create
  #   @location = Location.new(location_params)
  # 
  #   if @location.save
  #     redirect_to locations_path
  #   else
  #     render :new
  #   end
  # end
  #
  # def show
  #   @location = Location.find(params[:id])
  # end
  #
  # def edit
  #   @location = Location.find(params[:id])
  # end
  # def update
  #   @location = Location.find(params[:id])
  #   if @location.update(location_params)
  #     redirect_to location_path(@location)
  #   else
  #     render :edit
  #   end
  # end

  private
  def location_params
    params.require(:location).permit(:city, :state, :user_id, :restaurant_id)
  end
end
