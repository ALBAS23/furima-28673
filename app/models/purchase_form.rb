class PurchaseForm

  include ActiveModel::Model

  attr_accessor :postal_code, :shipment_prefecture_id, :municipality, :address, :building, :phone_number, :user_id, :item_id, :token
  
  with_options presence: true do
    validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/ }
    validates :municipality, :address, :token, :user_id, :item_id
    validates :phone_number, format: { with: /\A\d{10,11}\z/ }
  end

  validates :shipment_prefecture_id, numericality:  { other_than: 1 }

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    BuyerInformation.create(postal_code: postal_code, shipment_prefecture_id: shipment_prefecture_id, municipality: municipality, address: address, building: building, phone_number: phone_number, order_id: order.id)
  end

end