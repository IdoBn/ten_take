class ItemsController < ApplicationController
	before_action :authenticate_user!

  def index
  	@items = Item.all
  	render json: {items: @items}
  end

  def show
  	@item = Item.find(params[:id])
  	render json: {item: @item}
  end

  def update
  	@item = Item.find(params[:id])
  	if @item.update_attributes(params[:item])
  		render json: {item: @item}
  	else
  		render json: {errors: @item.errors.full_messages}
  	end
  end

  def create
  	@item = Item.new(params[:item])
  	if @item.save!
  		render json: {item: @item}
  	else
  		render json: {errors: @item.errors.full_messages}
  	end
  end

  def item_params
  	params.require(:item).permit(:status)
  end
end
