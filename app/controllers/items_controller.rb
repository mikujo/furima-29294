class ItemsController < ApplicationController
  before_action :move_to_index, only: :new
  def index
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

  def move_to_index
    unless user_signed_in?
      redirect_to root_path
    end
  end

  private
  def item_params
    params.require(:item).permit(:image, :name, :detail, :category_id, :status_id, :postage_id, :prefecture_id, :shipping_day_id, :price).merge(user_id: current_user.id)
  end
end
