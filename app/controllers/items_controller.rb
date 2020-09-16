class ItemsController < ApplicationController
  def new
    @item = Item.new
  end

  def create
    Item.create(item_params)
  end

  private
  def item_params
    params.require(:item).permit(:image, :name, :detail, :category_id, :status_id, :postage_id, :prefecture_id, :shipping_day_id, :price).merge(user_id: current_user.id)
end
