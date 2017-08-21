class BrandOrdersController < ApplicationController
  before_action :user_signin
  before_action :user_actived

  def index
    # 0 tao moi
    # 1 doi admin
    # 2 admin khong thanh cong
    # 3 admin thanh cong doi brand
    # 4 brand khong thanh cong
    # 5 brand thanh cong
    @carded = Card.where(status: 5)
    @caring = Card.where(status: 4)
  end

  def show
    # 0 tao moi
    # 1 doi admin
    # 2 admin khong thanh cong
    # 3 admin thanh cong doi brand
    # 4 brand khong thanh cong
    # 5 brand thanh cong
    @cards = Card.where(status: 3)
  end

  def create
    @card = Card.find_by id: params[:card_id]
    if params[:accept].present?
      if params[:accept] == "0"
        @card.update_attributes(status: 4)
        flash[:success] = "Not active"
      else
        @card.update_attributes(status: 5)
        flash[:success] = "Active"
      end
    end
    redirect_to brand_orders_path
  end
end
