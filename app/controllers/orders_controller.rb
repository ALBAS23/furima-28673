class OrdersController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
    @purchase_form = PurchaseForm.new
  end

  def create
    @item = Item.find(params[:item_id])
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
    Payjp.api_key = 'sk_test_e4d3ab6c47585489abe110fd'
      Payjp::Charge.create(
        amount: @item.price,
        card: @purchase_form.token,
        currency: 'jpy'
      )
  end

end
