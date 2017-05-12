class Admin::ActiveOrdersController < ApplicationController
  before_action :user_signin
  before_action :user_actived
  before_action :admin

  def index
    # 0 tao moi
    # 1 doi admin
    # 2 admin khong thanh cong
    # 3 admin thanh cong doi brand
    # 4 brand khong thanh cong
    # 5 brand thanh cong
    @carded = Card.where(status: 5)
    @caring = Card.where(status: 3)
    @array = [2, 4]
    @carings = Card.where("status in (?)", @array)
  end

  def show
    @cards = Card.where(status: 1)
  end

  def create
    @card = Card.find_by id: params[:card_id]
    if params[:accept].present?
      if params[:accept] == "0"
        @card.update_attributes(status: 2)
        flash[:success] = "Not active"
      else
        @all_total = @card.total + @card.total*params[:rate].to_i
        @card.update_attributes(shipping: params[:rate].to_i,
          status: 3, all_total: @all_total)
        flash[:success] = "Active"
      end
    end
    redirect_to admin_active_orders_path
  end
end
