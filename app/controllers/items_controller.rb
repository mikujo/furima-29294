class ItemsController < ApplicationController
  before_action :move_to_index, only: :new
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :move_to_show, only: [:edit, :destroy]

  def index
    @items = Item.all.order('created_at DESC')
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
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    if @item.destroy
      redirect_to root_path
    else
      render :show
    end
  end

  def move_to_index
    redirect_to root_path unless user_signed_in?
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def move_to_show
    item = Item.find(params[:id])
    redirect_to item_path unless user_signed_in? || current_user.id == item.user_id
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :detail, :category_id, :status_id, :postage_id, :prefecture_id, :shipping_day_id, :price).merge(user_id: current_user.id)
  end
end
