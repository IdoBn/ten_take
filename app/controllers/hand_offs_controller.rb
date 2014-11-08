class HandOffsController < ApplicationController
	before_action :authenticate_user!

  def create
  	@hand_off = HandOff.new(params[:hand_off])
  	if @hand_off.save!
  		render json: {hand_off: @hand_off}
  	else
  		render json: {errors: @hand_off.errors.full_messages}
  	end
  end

  def update
  	@hand_off = HandOff.find(params[:id])
  	if @hand_off.next_step(current_user.id)
  		render json: {hand_off: @hand_off}
  	else
  		render json: {errors: @hand_off.errors.full_messages}
  	end
  end
end
