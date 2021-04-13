require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '#create' do
    before do
      @item = FactoryBot.build(:item)
    end

    context '商品を出品(DBに登録)できるとき' do
      it '登録情報が正しく入力されていれば、商品を出品できること' do
        expect(@item).to be_valid
      end
      it '値段が300円以上で出品できること' do
        @item.price = 300
        expect(@item).to be_valid
      end
      it '値段が9,999,999円以下で出品できること' do
        @item.price = 9_999_999
        expect(@item).to be_valid
      end
      it '商品カテゴリでid = 2を選択した場合、出品できること' do
        @item.category_id = 2
        expect(@item).to be_valid
      end
      it '商品カテゴリでid = 11を選択した場合、出品できること' do
        @item.category_id = 11
        expect(@item).to be_valid
      end
      it '商品の状態でid = 2を選択した場合、出品できること' do
        @item.item_status_id = 2
        expect(@item).to be_valid
      end
      it '商品の状態でid = 7を選択した場合、出品できること' do
        @item.item_status_id = 7
        expect(@item).to be_valid
      end
      it '配送料の負担でid = 2を選択した場合、出品できること' do
        @item.delivery_fee_id = 2
        expect(@item).to be_valid
      end
      it '配送料の負担でid = 3を選択した場合、出品できること' do
        @item.delivery_fee_id = 3
        expect(@item).to be_valid
      end
      it '発送元の地域でid = 2を選択した場合、出品できること' do
        @item.prefecture_id = 2
        expect(@item).to be_valid
      end
      it '発送元の地域でid = 48を選択した場合、出品できること' do
        @item.prefecture_id = 48
        expect(@item).to be_valid
      end
      it '発想までの日数でid = 2を選択した場合、出品できること' do
        @item.date_of_delivery_id = 2
        expect(@item).to be_valid
      end
      it '発想までの日数でid = 4を選択した場合、出品できること' do
        @item.date_of_delivery_id = 4
        expect(@item).to be_valid
      end
    end

    context '商品を出品(DBに登録)できないとき' do
      it '商品画像が添付されていないとき、出品できないこと' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it '商品名が空白では出品できないこと' do
        @item.item_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item name can't be blank")
      end
      it '商品説明が空白では出品できないこと' do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end
      it '値段が空白では出品できないこと' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it '値段が300円未満では出品できないこと' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include("Price Out of setting range")
      end
      it '値段が9,999,999円より大きい場合、出品できないこと' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price Out of setting range")
      end
      it '商品カテゴリでid = 1(--)を選択した場合、出品できないこと' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category Select")
      end
      it '商品の状態でid = 1(--)を選択した場合、出品できないこと' do
        @item.item_status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Item status Select")
      end
      it '配送料の負担でid = 1(--)を選択した場合、出品できないこと' do
        @item.delivery_fee_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery fee Select")
      end
      it '発送元の地域でid = 1(--)を選択した場合、出品できないこと' do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture Select")
      end
      it '発送までの日数でid = 1(--)を選択した場合、出品できないこと' do
        @item.date_of_delivery_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Date of delivery Select")
      end
    end
  end
end
