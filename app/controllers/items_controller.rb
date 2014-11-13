class ItemsController < ApplicationController
	before_action :authenticate_user!

  def index
  	@items = Item.all
  	render json: @item, each_serializer: ItemSerializer
  end

  def show
  	@item = Item.find(params[:id])
  	render json: @item, each_serializer: ItemSerializer
  end

  def update
  	@item = current_user.items.find(params[:id])
  	if @item.update_attributes(item_params)
  		render json: ItemSerializer.new(@item).to_json
  	else
  		render json: {errors: @item.errors.full_messages}
  	end
  end

  def create
  	@item = current_user.items.new(item_params)
  	if @item.save!
  		render json: ItemSerializer.new(@item).to_json
  	else
  		render json: {errors: @item.errors.full_messages}
  	end
  end

  def item_params
  	params.require(:item).permit(:title, :description, :image)
  end
end
