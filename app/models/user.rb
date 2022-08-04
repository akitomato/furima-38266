class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # has_many :commodities
  # has_many :buys

  with_options presence: true do
    validates :nickname
    validates :birth_day
  end
  
  with_options presence: true, format: { with: (/\A[ぁ-んァ-ヶ一-龥々ー]+\z/), message: '全角（漢字・ひらがな・カタカナ）での入力をしてください' } do
    validates :last_name
    validates :first_name
  end

  with_options presence: true, format: { with: (/\A[ァ-ヶー]+\z/), message: '全角（カタカナ）での入力をしてください' } do
    validates :last_kana
    validates :first_kana
  end

  validates :password, format: { with: (/\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i), message: 'パスワードは、半角英数字混合での入力が必須です' }

end
