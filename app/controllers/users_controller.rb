class UsersController < ApplicationController
  def show
  	@user = User.find(params[:id])
  	@items = @user.items
  end

  def index
  	@users = User.all
  end

end
