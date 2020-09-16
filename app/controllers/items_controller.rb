class ItemsController < ApplicationController
  def new
    @item = Item.new
  end

  def create
    Item.create(item_params)
  end

  private
  def item_params
    params.require(:item).permit(:name, :detail, :category, :status, :postage, :prefecture, :shipping_day, :price).merge(user_id: current_user.id)
end
