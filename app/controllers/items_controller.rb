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

    # else
    #   @items = Item.all
    end
  end

  def new
    @item = Item.new
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      respond_to do |format|
        format.html {redirect_to restaurant_item_path(@item.restaurant_id, @item)}
        format.json {render json: @restaurants}
      end

      #redirect_to restaurant_item_path(@item.restaurant_id, @item)
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
    # else
    #   @item = Item.find(params[:id])
    #   @restaurant = Restaurant.find(params[:restaurant_id])
    end
  end

  def edit
    @item = Item.find(params[:id])
    @restaurant = Restaurant.find(params[:restaurant_id])
  end
  def update
    @item = Item.find(params[:id])

    if @item.update(item_params)
      redirect_to restaurant_item_path(@item.restaurant_id, @item)
    else
      @restaurant = Restaurant.find(params[:item][:restaurant_id])
      render :edit
    end
  end

  def destroy
    item = Item.find(params[:id])
    restaurant = Restaurant.find_by(id: item.restaurant_id)
    item.destroy
    redirect_to restaurant_items_path(restaurant)
  end

  private
  def item_params
    params.require(:item).permit(:name, :vegetarian, :calories, :restaurant_id, :price, :category)
  end
end
