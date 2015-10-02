class ItemsController < ApplicationController
  def index
  	@items = Item.all
    @unique_items = Item.select(:name).distinct
  end

  def create_copy
    @item = Item.find(params[:item_id])
    @item_copy = Item.new
    @item_copy.copy_item(current_user.id, @item.name, @item.description, @item.category, @item.image)
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

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to root_path
    else
      render 'edit'
    end
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

  def travel
    @items = Item.by_category('Travel')
  end

  def life_choices
    @items = Item.by_category('Life Choices')
  end

  def food_drink
    @items = Item.by_category('Food & Drink')
  end

  def career
    @items = Item.by_category('Career')
  end

  def family
    @items = Item.by_category('Family')
  end

  def other
    @items = Item.by_category('Other')
  end

  private

  def item_params
  	params.require(:item).permit(:name, :description, :category, :likes, :incomplete, :user_id, :image)
  end
end
