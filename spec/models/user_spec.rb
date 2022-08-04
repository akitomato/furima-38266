require 'rails_helper'

RSpec.describe User, type: :model do

  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できる場合' do
      it 'nicknameからbirth_dayまで全て存在する' do
        expect(@user).to be_valid
      end
    end

    context '新規登録できない場合' do
      it 'nicknameが空' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'emailが空' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it '同じemailで登録' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it '@を含まないemailで登録' do
        @user.email = 'aiueo'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
      it 'passwordが空' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordが5文字以下' do
        @user.password = 'a1234'
        @user.password_confirmation = 'a1234'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'passwordにアルファベットしかない' do
        @user.password = 'abcdef'
        @user.password_confirmation = 'abcdef'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password パスワードは、半角英数字混合での入力が必須です")
      end
      it 'passwordに数字しかない' do
        @user.password = '123456'
        @user.password_confirmation = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password パスワードは、半角英数字混合での入力が必須です")
      end
      it 'passwordとpassword_confirmationの不一致' do
        @user.password = 'abc123'
        @user.password_confirmation = '123abc'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'last_nameが空' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank", "Last name 全角（漢字・ひらがな・カタカナ）での入力をしてください")
      end
      it 'first_nameが空' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank", "First name 全角（漢字・ひらがな・カタカナ）での入力をしてください")
      end
      it 'last_nameに漢字・ひらがな・カタカナ以外の文字が含まれる' do
        @user.last_name = 'abc'
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name 全角（漢字・ひらがな・カタカナ）での入力をしてください")
      end
      it 'first_nameに漢字・ひらがな・カタカナ以外の文字が含まれる' do
        @user.first_name = 'abc'
        @user.valid?
        expect(@user.errors.full_messages).to include("First name 全角（漢字・ひらがな・カタカナ）での入力をしてください")
      end
      it 'last_kanaが空' do
        @user.last_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last kana can't be blank", "Last kana 全角（カタカナ）での入力をしてください")
      end
      it 'frist_kanaが空' do
        @user.first_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First kana can't be blank", "First kana 全角（カタカナ）での入力をしてください")
      end
      it 'last_kanaがカタカナではない' do
        @user.last_kana = 'てすと'
        @user.valid?
        expect(@user.errors.full_messages).to include("Last kana 全角（カタカナ）での入力をしてください")
      end
      it 'first_kanaがカタカナではない' do
        @user.first_kana = 'てすと'
        @user.valid?
        expect(@user.errors.full_messages).to include("First kana 全角（カタカナ）での入力をしてください")
      end
      it 'birth_dayが空' do
        @user.birth_day = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birth day can't be blank")
      end
    end
  end
end
