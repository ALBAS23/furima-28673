class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit]
  before_action :user_data, only: [:show, :edit, :update, :destroy]
  before_action :direct, only: :edit

  def index
    @items = Item.order(created_at: :DESC)
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
    @item.destroy
    redirect_to root_path
  end

  private

  def item_params
    params.require(:item).permit(:name, :image, :explanation, :category_id, :status_id, :delivery_fee_id,
                                 :shipment_prefecture_id, :shipment_day_id, :price).merge(user_id: current_user.id)
  end

  def user_data
    @item = Item.find(params[:id])
  end

  def direct
    redirect_to root_path unless current_user.id == @item.user.id
  end
end
