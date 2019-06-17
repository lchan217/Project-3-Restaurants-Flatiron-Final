class ItemsController < ApplicationController
  before_action :require_login

  def index
    if params[:restaurant_id]
      @items = Restaurant.find(params[:restaurant_id]).items
      @restaurant = Restaurant.find(params[:restaurant_id])
      respond_to do |format|
        format.html {render :index}
        format.json {render json: @items}
      end
    end
  end

  def new
    if current_user.restaurants.uniq.include?(Restaurant.find(params[:restaurant_id]))
      @item = Item.new
      @restaurant = Restaurant.find(params[:restaurant_id])
    else
      redirect_to restaurants_path
    end
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      render json: @item, status: 201
    else
      @restaurant = Restaurant.find(params[:item][:restaurant_id])
      render :new
    end
  end

  def show
    if params[:restaurant_id]
      @item = Restaurant.find(params[:restaurant_id]).items.find(params[:id])
      @restaurant = Restaurant.find(params[:restaurant_id])
      respond_to do |format|
        format.html {render :show}
        format.json {render json: @item}
      end
    end
  end

  def edit
    if current_user.restaurants.uniq.include?(Restaurant.find(params[:restaurant_id]))
      @item = Item.find(params[:id])
      @restaurant = Restaurant.find(params[:restaurant_id])
    else
      redirect_to restaurants_path
    end
  end

  def update
    @item = Item.find(params[:id])

    if @item.update(item_params)
        redirect_to restaurant_path(@item.restaurant_id)
    else
      # @restaurant = Restaurant.find(params[:item][:restaurant_id])
      render :edit
    end
  end

  def destroy
    if current_user.restaurants.uniq.include?(Restaurant.find(params[:restaurant_id]))
      item = Item.find(params[:id])
      restaurant = Restaurant.find_by(id: item.restaurant_id)
      item.destroy
      redirect_to restaurant_path(restaurant)
    else
      redirect_to restaurants_path
    end
  end

  private
  def item_params
    params.require(:item).permit(:name, :vegetarian, :calories, :restaurant_id, :price, :category)
  end
end
