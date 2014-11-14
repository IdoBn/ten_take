class HandOffsController < ApplicationController
	before_action :authenticate_user!

  def create
  	@hand_off = current_user.borrows.find(params[:borrow_id]).hand_off!
  	if @hand_off.save!
  		render json: {hand_off: @hand_off}
  	else
  		render json: {errors: @hand_off.errors.full_messages}
  	end
  end

  def update
  	@hand_off = HandOff.find(params[:id])
    @hand_off.next_step(current_user.id)
  	if @hand_off.save!
  		render json: {hand_off: @hand_off}
  	else
  		render json: {errors: @hand_off.errors.full_messages}
  	end
  end
end
