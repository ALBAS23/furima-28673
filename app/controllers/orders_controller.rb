class OrdersController < ApplicationController
  before_action :authenticate_user!, only: :index
  before_action :item_information, only: [:index, :create]
  before_action :top_redirect, only: :index

  def index
    @purchase_form = PurchaseForm.new
  end

  def create
    @purchase_form = PurchaseForm.new(purchase_params)
    if @purchase_form.valid?
      pay_item()
      @purchase_form.save
      redirect_to root_path
    else
      render  action: :index
    end
  end

  private

  def purchase_params
    params.require(:purchase_form).permit(:postal_code, :shipment_prefecture_id, :municipality, :address, :building, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @item.price,
        card: @purchase_form.token,
        currency: 'jpy'
      )
  end

  def item_information
    @item = Item.find(params[:item_id])
  end

  def top_redirect
     redirect_to root_path unless current_user.id == @item.user.id || @item.order 
  end

end
