require 'rails_helper'

RSpec.describe PurchaseForm, type: :model do
  before do
    buyer = FactoryBot.create(:user)
    seller = FactoryBot.create(:user)
    item = FactoryBot.create(:item, user_id: seller.id)
    @purchase_form = FactoryBot.build(:purchase_form, user_id: buyer.id, item_id: item.id)
    sleep(1)
  end

  describe 'トークン情報の送信と購入情報および配送先情報の保存' do
    context '正常に保存できる場合' do
      it '全てのデータが存在すれば、登録できる' do
        expect(@purchase_form).to be_valid
      end
      it 'buildingが空の場合でも、登録できる' do
        @purchase_form.building = nil
        expect(@purchase_form).to be_valid
      end
    end

    context '正常に保存できない場合' do
      it 'postal_code(郵便番号)が空の場合、登録できない' do
        @purchase_form.postal_code = nil
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include "Postal code can't be blank"
      end
      it 'shipment_prefecture_id(都道府県)のidが１の場合、登録できない' do
        @purchase_form.shipment_prefecture_id = 1
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include 'Shipment prefecture must be other than 1'
      end
      it 'municipality(市区町村)が空の場合、登録できない' do
        @purchase_form.municipality = nil
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include "Municipality can't be blank"
      end
      it 'address(番地)が空の場合、登録できない' do
        @purchase_form.address = nil
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include "Address can't be blank"
      end
      it 'phone_number(電話番号)が空の場合、登録できない' do
        @purchase_form.phone_number = nil
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include "Phone number can't be blank"
      end
      it 'token(クレジットカード情報)が空の場合、登録できない' do
        @purchase_form.token = nil
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include "Token can't be blank"
      end
      it 'postal_code(郵便番号)にハイフンがない場合、登録できない' do
        @purchase_form.postal_code = '1234567'
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include 'Postal code is invalid'
      end
      it 'postal_code(郵便番号)が3文字ハイフン4文字でない場合、登録できない' do
        @purchase_form.postal_code = '214'
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include 'Postal code is invalid'
      end
      it 'postal_code(郵便番号)が全角の場合、登録できない' do
        @purchase_form.postal_code = '１２３-４５６７'
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include 'Postal code is invalid'
      end
      it 'phone_number(電話番号)にハイフンがある場合、登録できない' do
        @purchase_form.phone_number = '090-3456-2314'
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include 'Phone number is invalid'
      end
      it 'phone_number(電話番号)が11桁より多い場合、登録できない' do
        @purchase_form.phone_number = '090345678904'
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include 'Phone number is invalid'
      end
      it 'phone_number(電話番号)が11桁より多い場合、登録できない' do
        @purchase_form.phone_number = '09034'
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include 'Phone number is invalid'
      end
      it 'phone_number(電話番号)が全角の場合、登録できない' do
        @purchase_form.phone_number = '０９０４５６７８９０１'
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include 'Phone number is invalid'
      end
      it 'ユーザー情報が紐付いていないと、登録できない' do
        @purchase_form.user_id = nil
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include "User can't be blank"
      end
      it '商品情報が紐付いていないと、登録できない' do
        @purchase_form.item_id = nil
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include "Item can't be blank"
      end
    end
  end
end
