class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :shipment_prefecture
  belongs_to :delivery_fee
  belongs_to :shipment_day
  belongs_to :status

  belongs_to :user

  columns = [name, explanation, category_id, status_id, delivery_fee_id, shipment_prefecture_id, shipment_day_id, price]

  with_options presence: true do 
    columns.each do |column|
      validates column
    end
  end

end
