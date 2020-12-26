class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :shipment_prefecture
  belongs_to :delivery_fee
  belongs_to :shipment_day
  belongs_to :status

  belongs_to :user

  has_one_attached  :image

  columns = [:name, :image, :explanation, :category_id, :status_id, :delivery_fee_id, :shipment_prefecture_id, :shipment_day_id, :price] 

  with_options presence: true do 
    columns.each do |column|
      validates column
    end
  end

  ids = [:category_id, :status_id, :delivery_fee_id, :shipment_prefecture_id, :shipment_day_id]

  with_options numericality: { other_than: 1 } do
    ids.each do |id|
      validates id
    end
  end

  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }

end
