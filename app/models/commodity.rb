class Commodity < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :prefecture
  belongs_to :send_day
  belongs_to :condition
  belongs_to :delivery_charge
  has_one_attached :image
  belongs_to :user
  has_one :buy

  with_options presence: { message: 'は必須項目です' } do
    validates :name
    validates :detail
    validates :image
  end
  with_options presence: true, numericality: { other_than: 1, message: '項目の選択必須です' } do
    validates :category_id
    validates :prefecture_id
    validates :send_day_id
    validates :condition_id
    validates :delivery_charge_id
  end
  with_options presence: true, numericality: {
    only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999,
    message: '価格は指定範囲内で入力必須です。(半角数字でご入力ください)'
  } do
    validates :price
  end
end
