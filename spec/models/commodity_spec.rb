require 'rails_helper'

RSpec.describe Commodity, type: :model do
  before do
    @commodity = FactoryBot.build(:commodity)
  end

  describe '商品出品' do
    context '出品成功' do
      it '全カラムに必要な情報の入力ができている' do
        expect(@commodity).to be_valid
      end
    end
    context '出品失敗' do
      it '商品名が空' do
        @commodity.name = ''
        @commodity.valid?
        expect(@commodity.errors.full_messages).to include("Name は必須項目です")
      end
      it '商品詳細が空' do
        @commodity.detail = ''
        @commodity.valid?
        expect(@commodity.errors.full_messages).to include("Detail は必須項目です")
      end
      it '商品画像が添付されていない' do
        @commodity.image = nil
        @commodity.valid?
        expect(@commodity.errors.full_messages).to include("Image は必須項目です")
      end
      it 'カテゴリー選択してない' do
        @commodity.category_id = 1
        @commodity.valid?
        expect(@commodity.errors.full_messages).to include("Category 項目の選択必須です")
      end
      it '商品の状態を選択していない' do
        @commodity.condition_id = 1
        @commodity.valid?
        expect(@commodity.errors.full_messages).to include("Condition 項目の選択必須です")
      end
      it '配送料の負担を選択していない' do
        @commodity.delivery_charge_id = 1
        @commodity.valid?
        expect(@commodity.errors.full_messages).to include("Delivery charge 項目の選択必須です")
      end
      it '発送元地域の選択していない' do
        @commodity.prefecture_id = 1
        @commodity.valid?
        expect(@commodity.errors.full_messages).to include("Prefecture 項目の選択必須です")
      end
      it '発送までの日数を選択していない' do
        @commodity.send_day_id = 1
        @commodity.valid?
        expect(@commodity.errors.full_messages).to include("Send day 項目の選択必須です")
      end
      it '価格が空' do
        @commodity.price = ''
        @commodity.valid?
        expect(@commodity.errors.full_messages).to include("Price can't be blank", "Price 価格は指定範囲内で入力必須です。(半角数字でご入力ください)")
      end
      it '価格が300円より低い' do
        @commodity.price = 299
        @commodity.valid?
        expect(@commodity.errors.full_messages).to include("Price 価格は指定範囲内で入力必須です。(半角数字でご入力ください)")
      end
      it '価格が999,999,999より多い' do
        @commodity.price = 1_000_000_000
        @commodity.valid?
        expect(@commodity.errors.full_messages).to include("Price 価格は指定範囲内で入力必須です。(半角数字でご入力ください)")
      end
      it '価格入力に半角数字以外の文字が入力される' do
        @commodity.price = '１０００'
        @commodity.valid?
        expect(@commodity.errors.full_messages).to include("Price 価格は指定範囲内で入力必須です。(半角数字でご入力ください)")
      end
      it 'userが紐づいていない' do
        @commodity.user = nil
        @commodity.valid?
        expect(@commodity.errors.full_messages).to include('User must exist')
      end
    end
  end
end
