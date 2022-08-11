class CommoditiesController < ApplicationController
  before_action :authenticate_user!, only: [:new]

  def index
    @commodities = Commodity.order('created_at DESC')
  end

  def new
    @commodity = Commodity.new
  end

  def create
    @commodity = Commodity.new(commodity_params)
    if @commodity.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def commodity_params
    params.require(:commodity).permit(
      :name, :detail, :price, :category_id, :prefecture_id, :send_day_id, :condition_id, :delivery_charge_id, :image
    ).merge(user_id: current_user.id)
  end
end
