class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_commodity
  before_action :sold_out_move_to_top_page
  before_action :self_buy_move_top_page

  def index
    @buy_buyeraddress = BuyBuyeraddress.new
  end

  def create
    @buy_buyeraddress = BuyBuyeraddress.new(buy_params)
    if @buy_buyeraddress.valid?
      pay_item
      @buy_buyeraddress.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def buy_params
    params.require(:buy_buyeraddress).permit(:post_code, :prefecture_id, :city, :address, :building_name, :phone_number,).merge(user_id: current_user.id, token: params[:token], commodity_id: params[:commodity_id])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  # 自身のPAY.JPテスト秘密鍵を記述しましょう
    Payjp::Charge.create(
      amount: @commodity.price,  # 商品の値段
      card: buy_params[:token],    # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end

  def sold_out_move_to_top_page
    if @commodity.buy.present?
      redirect_to root_path
    end
  end

  def set_commodity
    @commodity = Commodity.find(params[:commodity_id])
  end

  def self_buy_move_top_page
    if @commodity.user_id == current_user.id
      redirect_to root_path
    end
  end
end
