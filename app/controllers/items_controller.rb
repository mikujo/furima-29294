class ItemsController < ApplicationController
  before_action :move_to_index, only: :new
  def index
    @items = Item.all.order("created_at DESC")
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

  def show
    @item = Item.find(params[:id])
  end

  def move_to_index
    redirect_to root_path unless user_signed_in?
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :detail, :category_id, :status_id, :postage_id, :prefecture_id, :shipping_day_id, :price).merge(user_id: current_user.id)
  end
end
