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
    result = current_user.restaurants.uniq.find{|restaurant| restaurant.id} == Restaurant.find(params[:restaurant_id])
    if result == true
      @item = Item.new
      @restaurant = Restaurant.find(params[:restaurant_id])
    else
      @restaurant = Restaurant.find(params[:restaurant_id])
      redirect_to restaurant_items_path(@restaurant)
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
    result = current_user.restaurants.uniq.find{|restaurant| restaurant.id} == Restaurant.find(params[:restaurant_id])
    if result
      @item = Item.find(params[:id])
      @restaurant = Restaurant.find(params[:restaurant_id])
    else
      @restaurant = Restaurant.find(params[:restaurant_id])
      redirect_to restaurant_items_path(@restaurant)
    end
  end

  def update
    @item = Item.find(params[:id])

    if @item.update(item_params)
        redirect_to restaurant_path(@item.restaurant_id)
    else
      @restaurant = Restaurant.find(params[:item][:restaurant_id])
      render :edit
    end
  end

  def destroy
    item = Item.find(params[:id])
    restaurant = Restaurant.find_by(id: item.restaurant_id)
    item.destroy
    redirect_to restaurant_path(restaurant)
  end

  private
  def item_params
    params.require(:item).permit(:name, :vegetarian, :calories, :restaurant_id, :price, :category)
  end
end
