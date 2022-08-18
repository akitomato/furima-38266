require 'rails_helper'

RSpec.describe BuyBuyeraddress, type: :model do
  describe '購入履歴保存' do
    before do 
      user = FactoryBot.create(:user)
      commodity = FactoryBot.create(:commodity)
      @buy_buyeraddress = FactoryBot.build(:buy_buyeraddress, user_id: user.id, commodity_id: commodity.id)
    end

    context '履歴保存成功' do
      it 'user,commodityとの紐付けが正しくできている' do
        expect(@buy_buyeraddress).to be_valid
      end
      it 'building_nameは空でも保存できる' do
        @buy_buyeraddress.building_name = nil
        expect(@buy_buyeraddress).to be_valid
      end
    end
    context '履歴保存失敗' do
      it 'userとの紐付けができていない' do
        @buy_buyeraddress.user_id = nil
        @buy_buyeraddress.valid?
        expect(@buy_buyeraddress.errors.full_messages).to include("User 入力必須です")
      end
      it 'commodityとの紐付けができていない' do
        @buy_buyeraddress.commodity_id = nil
        @buy_buyeraddress.valid?
        expect(@buy_buyeraddress.errors.full_messages).to include("Commodity 入力必須です")
      end
      it 'post_codeが空の場合' do
        @buy_buyeraddress.post_code = ''
        @buy_buyeraddress.valid?
        expect(@buy_buyeraddress.errors.full_messages).to include("Post code 入力必須です")
      end
      it 'prefecture_idが1で選択されていないとき' do
        @buy_buyeraddress.prefecture_id = 1
        @buy_buyeraddress.valid?
        expect(@buy_buyeraddress.errors.full_messages).to include("Prefecture 選択必須項目です")
      end
      it 'cityが空の時' do
        @buy_buyeraddress.city = ''
        @buy_buyeraddress.valid?
        expect(@buy_buyeraddress.errors.full_messages).to include("City 入力必須です")
      end
      it 'addressが空の時' do
        @buy_buyeraddress.address = ''
        @buy_buyeraddress.valid?
        expect(@buy_buyeraddress.errors.full_messages).to include("Address 入力必須です")
      end
      it 'phone_numberが空の時' do
        @buy_buyeraddress.phone_number = ''
        @buy_buyeraddress.valid?
        expect(@buy_buyeraddress.errors.full_messages).to include("Phone number 入力必須です")
      end
      it 'post_codeをハイフンなしで入力' do
        @buy_buyeraddress.post_code = '1231234'
        @buy_buyeraddress.valid?
        expect(@buy_buyeraddress.errors.full_messages).to include("Post code ハイフン込みで正しく入力してください")
      end
      it 'post_codeの文字数が多い' do
        @buy_buyeraddress.post_code = '1234-1234'
        @buy_buyeraddress.valid?
        expect(@buy_buyeraddress.errors.full_messages).to include("Post code ハイフン込みで正しく入力してください")
      end
      it 'post_codeの文字数が少ない' do
        @buy_buyeraddress.post_code = '123-123'
        @buy_buyeraddress.valid?
        expect(@buy_buyeraddress.errors.full_messages).to include("Post code ハイフン込みで正しく入力してください")
      end
      it 'post_codeに半角数字以外の文字' do
        @buy_buyeraddress.post_code = '123-123４'
        @buy_buyeraddress.valid?
        expect(@buy_buyeraddress.errors.full_messages).to include("Post code ハイフン込みで正しく入力してください")
      end
      it 'phone_numberが9文字以下' do
        @buy_buyeraddress.phone_number = '123456789'
        @buy_buyeraddress.valid?
        expect(@buy_buyeraddress.errors.full_messages).to include("Phone number ハイフンなしで正しく入力してください")
      end
      it 'phone_numberが12文字以上' do
        @buy_buyeraddress.phone_number = '123456789012'
        @buy_buyeraddress.valid?
        expect(@buy_buyeraddress.errors.full_messages).to include("Phone number ハイフンなしで正しく入力してください")
      end
      it 'phone_numberに半角数字以外の文字' do
        @buy_buyeraddress.phone_number = '123456789０'
        @buy_buyeraddress.valid?
        expect(@buy_buyeraddress.errors.full_messages).to include("Phone number ハイフンなしで正しく入力してください")
      end
      it 'tokenが空の時' do
        @buy_buyeraddress.token = ''
        @buy_buyeraddress.valid?
        expect(@buy_buyeraddress.errors.full_messages).to include("Token 入力必須です")
      end
    end
  end
end