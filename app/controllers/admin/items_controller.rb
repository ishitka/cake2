class Admin::ItemsController < ApplicationController
  
  def new
    @item = Item.new
  end
  
  def create
    item = Item.new(item_params)
    item.save
    redirect_to admin_item_path(item.id)
  end
  
  def index
    if params[:name]
      @items = Item.where(name params[:name])
    else
      @items = Item.all
    end
  end
  
  def show
    @item = Item.find(params[:id])
  end
  
  def edit
    @item = Item.find(params[:id])
  end
  
  def update
    @item = Item.find(params[:id])
    @item.update(item_params)
    redirect_to admin_item_path(@item.id)
  end
  
  def destroy
    item = Item.find(params[:id])
    item.destroy
    redirect_to admin_items_path
  end
  
  private 
    def item_params
      params.require(:item).permit(:name, :introduction, :price, :is_status, :genre_id, :image)
    end
end
