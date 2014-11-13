class UsersController < ApplicationController
  def index
  	@users = User.all
  	render json: { users: @users.map { |u| UserSerializer.new(u) }.as_json(root: false) }
  end

  def show
  	@user = User.find(params[:id])
  	render json: UserWithItemSerializer.new(@user).as_json
  end
end
