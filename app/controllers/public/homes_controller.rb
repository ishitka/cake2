class Public::HomesController < ApplicationController
  before_action :authenticate_customer!
  
  def top
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

  def about
  end
end
