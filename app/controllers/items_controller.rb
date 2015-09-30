class ItemsController < ApplicationController
  def index
  	@items = Item.all
  end

  def create_copy
    @item = Item.find(params[:item_id])
    @item_copy = Item.new
    @item_copy.copy_item(current_user.id, @item.name, @item.description, @item.category)
    if @item.save
      flash[:success] = "Adventure Added"
      redirect_to items_path
    else
      flash[:error] = "Item not added"
      redirect_to items_path
    end
  end

  def show
  	@item = Item.find(params[:id])
  end

  def new
  	@item = Item.new
  end

  def create
  	@item = Item.new(item_params)
  	if @item.save
  		redirect_to root_path
  	else
  		render :new
  	end
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    redirect_to root_path
  end

  private

  def item_params
  	params.require(:item).permit(:name, :description, :category, :likes, :incomplete, :user_id)
  end
end
