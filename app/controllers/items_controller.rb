class ItemsController < ApplicationController
	before_action :authenticate_user!

  def index
    if(params[:state].blank?)
      @items = Item.all.where.not(user_id: current_user.id,status: "taken")
    else
      @items = Item.all.where(status: params[:state]).where.not(user_id: current_user.id,status: "taken")
    end
    render json: { items: @items.map { |i| ItemSerializer.new(i) }.as_json(root: false) }
  end

  def show
  	@item = Item.find(params[:id])
  	render json: ItemSerializer.new(@item)
  end

  def update
  	@item = current_user.items.find(params[:id])
  	if @item.update_attributes(item_params)
  		render json: ItemSerializer.new(@item).as_json
  	else
  		render json: {errors: @item.errors.full_messages}
  	end
  end

  def create
  	@item = current_user.items.new(item_params)
  	if @item.save!
  		render json: ItemSerializer.new(@item).as_json
  	else
  		render json: {errors: @item.errors.full_messages}
  	end
  end

  def item_params
  	params.require(:item).permit(:name, :description, :image)
  end
end
