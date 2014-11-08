class BorrowsController < ApplicationController
	before_action :authenticate_user!
  before_action :set_borrow, only: [:show]
	
  def index
  	@borrows = current_user.borrows
  	render json: {borrows: @borrows}
  end

  def show
  	render json: {borrow: @borrow}
  end

  # def update
  # 	if borrow.update_attributes(borrow_params)
  # 		render json: {borrow: borrow}
  # 	else
  # 		render json: {errors: borrow.errors.full_messages}
  # 	end
  # end

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
