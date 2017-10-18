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
    @carded = Card.joins(:brand).where(status: 5)
                                .where("brands.showroom_id = ? and brands.accept = 1", current_user.showroom_id)
    @caring = Card.joins(:brand).where(status: 3)
                                .where("brands.showroom_id = ? and brands.accept = 1", current_user.showroom_id)
    @array = [2, 4]
    @carings = Card.joins(:brand).where("status in (?)", @array)
                    .where("brands.showroom_id = ? and brands.accept = 1", current_user.showroom_id)
  end

  def show
    @cards = Card.joins(:brand).where(status: 1)
                  .where("brands.showroom_id = ? and brands.accept = 1", current_user.showroom_id)
  end

  def create
    @card = Card.find_by id: params[:card_id]
    if params[:accept].present?
      if params[:accept] == "0"
        @card.update_attributes(status: 2)
        flash[:success] = "Not active"
      else
        @all_total = @card.total + @card.total*params[:rate].to_i/100
        @card.update_attributes(shipping: params[:rate].to_i,
          status: 3, all_total: @all_total)
        flash[:success] = "Active"
      end
    end
    redirect_to admin_active_orders_path
  end
end
