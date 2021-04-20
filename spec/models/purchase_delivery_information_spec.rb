require 'rails_helper'

RSpec.describe PurchaseDeliveryInformation, type: :model do
  describe '商品購入情報の保存' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @purchase_delivery_information = FactoryBot.build(:purchase_delivery_information, price: item.price, user_id: user.id,
                                                                                        item_id: item.id)
      sleep 0.1 # 0.1秒待機
    end

    context '内容に問題ない場合' do
      it '全ての値が正しく入力されていれば、保存できること' do
        expect(@purchase_delivery_information).to be_valid
      end
    end
    
    context '内容に問題がある場合' do
      it 'priceが空の場合、保存できないこと' do
        @purchase_delivery_information.price = nil
        @purchase_delivery_information.valid?
        expect(@purchase_delivery_information.errors.full_messages).to include("Price can't be blank")
      end
      it 'tokenが空の場合、保存できないこと' do
        @purchase_delivery_information.token = nil
        @purchase_delivery_information.valid?
        expect(@purchase_delivery_information.errors.full_messages).to include("Token can't be blank")
      end
      it 'userが紐づいていないと保存できないこと' do
        @purchase_delivery_information.user_id = nil
        @purchase_delivery_information.valid?
        expect(@purchase_delivery_information.errors.full_messages).to include("User can't be blank")
      end
      it 'itemが紐づいていないと保存できないこと' do
        @purchase_delivery_information.item_id = nil
        @purchase_delivery_information.valid?
        expect(@purchase_delivery_information.errors.full_messages).to include("Item can't be blank")
      end
      it 'postal_codeが空の場合、保存できないこと' do
        @purchase_delivery_information.postal_code = ''
        @purchase_delivery_information.valid?
        expect(@purchase_delivery_information.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'postal_codeが半角ハイフンを含んだ正しい形式でない場合、保存できないこと' do
        @purchase_delivery_information.postal_code = '1234567'
        @purchase_delivery_information.valid?
        expect(@purchase_delivery_information.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
      end
      it 'prefecture_idを選択していない場合、保存できないこと' do
        @purchase_delivery_information.prefecture_id = 1
        @purchase_delivery_information.valid?
        expect(@purchase_delivery_information.errors.full_messages).to include("Prefecture Select")
      end
      it 'cityが空の場合、保存できないこと' do
        @purchase_delivery_information.city = ''
        @purchase_delivery_information.valid?
        expect(@purchase_delivery_information.errors.full_messages).to include("City can't be blank")
      end
      it 'addressが空の場合、保存できないこと' do
        @purchase_delivery_information.address = ''
        @purchase_delivery_information.valid?
        expect(@purchase_delivery_information.errors.full_messages).to include("Address can't be blank")
      end
      it 'buildingが空の場合でも、保存できること' do
        @purchase_delivery_information.building = ''
        expect(@purchase_delivery_information).to be_valid
      end
      it 'phoneが空の場合、保存できないこと' do
        @purchase_delivery_information.phone = ''
        @purchase_delivery_information.valid?
        expect(@purchase_delivery_information.errors.full_messages).to include("Phone can't be blank")
      end
      it 'phoneに数字以外の値が含まれている場合、保存できないこと' do
        @purchase_delivery_information.phone = '123-4567-8901'
        @purchase_delivery_information.valid?
        expect(@purchase_delivery_information.errors.full_messages).to include("Phone Input only number")
      end
    end
  end
end
