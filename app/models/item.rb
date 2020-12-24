class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :shipment_prefecture
  belongs_to :delivery_fee
  belongs_to :shipment_day
  belongs_to :status
end
