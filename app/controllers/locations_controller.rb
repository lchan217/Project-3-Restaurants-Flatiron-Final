class LocationsController < ApplicationController
    before_action :require_login
  def all_restaurants_in_db
    if params[:query_search] && params[:query_existing] == ""
      @location = Location.search(params[:query_search]).order(:city)
      @state = params[:query_search]
    elsif params[:query_existing] && params[:query_search] == ""
      @location = Location.search(params[:query_existing]).order(:city)
      @state = params[:query_existing]
    else
      @location = Location.all.order(:city)
      @state = "All results"
    end
    render 'all_restaurants_in_db'
  end

  def restaurant_params
    params.require(:location).permit(:query_search, :query_existing, :city, :state)
  end
end
