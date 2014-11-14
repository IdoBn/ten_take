class BorrowsController < ApplicationController
	before_action :authenticate_user!
  before_action :set_borrow, only: [:show]
	
  def index
    if !params[:borrower].blank?
      @borrows = current_user.borrows.where(status: "want")
    elsif !params[:lender].blank?
      @borrows = Borrow.where(status: 'want').joins(:item).merge(Item.where(user_id: current_user.id))
    else
      @borrows = current_user.borrows
    end
  	render json: {borrows: @borrows.map { |b| BorrowSerializer.new(b).as_json(root: false) }}
  end

  def show
  	render json: {borrow: @borrow}
  end

   def destroy
    @borrow = current_user.borrows.where(item_id: params[:id],status: "want")
  	if @borrow.destroy_all
  		render json: {borrow: BorrowSerializer.new(@borrow).as_json}
  	else
  		render json: {errors: @borrow.errors.full_messages}
  	end
   end

  def create
  	@borrow = current_user.borrow!(params[:item_id])
  	if @borrow.save
  		render json: { borrow: @borrow }
  	else
  		render json: { errors: @borrow.errors.full_messages }
  	end
  end

 private
 	def set_borrow
 		@borrow ||= Borrow.find(params[:id])
 	end

 	def borrow_params
 		params.require(:borrow).permit()
 	end
end
