class CommoditiesController < ApplicationController
  def index
  end

  def new
    if user_signed_in?
      @commodity = Commodity.new
    else
      render("devise/sessions/new")
    end
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
