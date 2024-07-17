class Public::ItemsController < ApplicationController
  def index
    @items = Item.all
    @genres = Genre.all
    if params[:name].present?
      @items = Item.where(name: params[:name])
    elsif params[:genre_name].present?
      @items = []
      @genres = Genre.where(name: params[:genre_name])
      @genres.each do |genre|
      @items += genre.items
      end
    end
  end
  
  def show
    @item = Item.find(params[:id])
    @genres = Genre.all
    if params[:name].present?
      @items = Item.where(name: params[:name])
    elsif params[:genre_name].present?
      @items = []
      @genres = Genre.where(name: params[:genre_name])
      @genres.each do |genre|
      @items += genre.items
      end
    end
  end
  
  private
  
  def item_params
    params.require(:item).permit(:name, :introduction, :price, :is_status, :genru_id, :image)
  end
end
