class BuyBuyeraddress
  include ActiveModel::Model
  attr_accessor :post_code, :prefecture_id, :city, :address, :phone_number, :user_id, :commodity_id, :token, :building_name

  with_options presence: { message: '入力必須です' } do
    validates :post_code, format: { with: (/\A\d{3}[-]\d{4}\z/), message: 'ハイフン込みで正しく入力してください' }
    validates :prefecture_id, numericality: { other_than: 1, message: '選択必須項目です' }
    validates :city
    validates :address
    validates :phone_number, format: { with: (/\A\d{10,11}\z/), message: 'ハイフンなしで正しく入力してください' }
    validates :token
    validates :user_id
    validates :commodity_id
  end

  def save
    buy = Buy.create(user_id: user_id, commodity_id: commodity_id)
    BuyerAddress.create(post_code: post_code, prefecture_id: prefecture_id, city: city, address: address, phone_number: phone_number, buy_id: buy.id, building_name: building_name)
  end
end