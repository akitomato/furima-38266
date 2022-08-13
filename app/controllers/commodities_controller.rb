class CommoditiesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit]
  before_action :move_to_top_page, only: [:edit]
  before_action :set_commodity, only: [:show, :edit, :update]

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

  def show
  end

  def edit
  end

  def update
    if @commodity.update(commodity_params)
      redirect_to commodity_path
    else
      render :edit
    end
  end

  private

  def commodity_params
    params.require(:commodity).permit(
      :name, :detail, :price, :category_id, :prefecture_id, :send_day_id, :condition_id, :delivery_charge_id, :image
    ).merge(user_id: current_user.id)
  end

  def move_to_top_page
    @commodity = Commodity.find(params[:id])
    unless current_user.id == @commodity.user_id
      redirect_to root_path
    end
  end

  def set_commodity
    @commodity = Commodity.find(params[:id])
  end
end
