require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能' do
    context '商品登録が成功する場合' do
      # 1
      it 'name, image, explanation, category_id, status_id, delivery_fee_id, shipment_prefecture_id, shipment_day_id, priceに正しくデータが入力された場合、正常に登録できる' do
        expect(@item).to be_valid
      end
      # 2
      it '商品名が40文字以下の場合、登録できる' do
        @item.name = Faker::Lorem.characters(number: 40)
        expect(@item).to be_valid
      end
      # 3
      it '商品の説明が1,000文字以下の場合、登録できる' do
        @item.explanation = Faker::Lorem.characters(number: 1000)
        expect(@item).to be_valid
      end
      # 4
      it 'priceの値が300円以上の場合、登録できる' do
        @item.price = 300
        expect(@item).to be_valid
      end
      # 5
      it 'priceの値が9,999,999以下の場合、登録できる' do
        @item.price = 9_999_999
        expect(@item).to be_valid
      end
    end

    context '商品登録が失敗しない場合' do
      # 1
      it '商品画像（image）がない場合、登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Image can't be blank"
      end
      # 2
      it '商品の説明（explanation）がない場合、登録できない' do
        @item.explanation = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Explanation can't be blank"
      end
      # 3
      it 'カテゴリー（category_id）が選択されていない場合（category_id = 1 の場合）、登録できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include 'Category must be other than 1'
      end
      # 4
      it '商品の状態（status_id）が選択されていない場合（status_id = 1 の場合）、登録できない' do
        @item.status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include 'Status must be other than 1'
      end
      # 5
      it '配送料の負担（delivery_fee_id）が選択されていない場合（delivery_fee_id = 1 の場合）、登録できない' do
        @item.delivery_fee_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include 'Delivery fee must be other than 1'
      end
      # 6
      it '配送元の地域（shipment_prefecture_id）が選択されていない場合（shipment_prefecture_id = 1 の場合）、登録できない' do
        @item.shipment_prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include 'Shipment prefecture must be other than 1'
      end
      # 8
      it '発送までの日数（shipment_day_id）が選択されていない場合（shipment_day_id = 1 の場合）、登録できない' do
        @item.shipment_day_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include 'Shipment day must be other than 1'
      end
      # 9
      it '価格（price）がない場合、登録できない' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Price can't be blank"
      end
      # 10
      it '商品名が40文字を超えた場合、登録できない' do
        @item.name = Faker::Lorem.characters(number: 41)
        @item.valid?
        expect(@item.errors.full_messages).to include 'Name is too long (maximum is 40 characters)'
      end
      # 11
      it '商品の説明が1,000文字を超えた場合、登録できない' do
        @item.explanation = Faker::Lorem.characters(number: 1001)
        @item.valid?
        expect(@item.errors.full_messages).to include 'Explanation is too long (maximum is 1000 characters)'
      end
      # 12
      it 'priceの値が300円未満の場合、登録できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include 'Price must be greater than or equal to 300'
      end
      # 13
      it 'priceの値が9,999,999円を超えた場合、登録できない' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include 'Price must be less than or equal to 9999999'
      end
      # 14
      it '出品者が紐付かない場合、登録できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include 'User must exist'
      end
    end
  end
end
