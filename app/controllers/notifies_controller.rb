class NotifiesController < ApplicationController
  before_action :user_signin
  before_action :user_actived
  def index
    if current_user.type_user == 0
      @notifi = Connection.where(brand_id: current_user.brand.id, seen: 1, status: 2)
    elsif current_user.type_user == 1
      @notifi = Connection.where(retailler_id: current_user.retailler.id, seen: 3, status: 2)
    end
  end

  def show
    # 0 tao moi
    # 1 doi admin
    # 2 admin khong thanh cong
    # 3 admin thanh cong doi brand
    # 4 brand khong thanh cong
    # 5 brand thanh cong
    @card_send = Card.where(status: 3).order('updated_at DESC')
    @card_admin_fail = Card.where(status: 2).order('updated_at DESC')
  end

  def retailler
    @card_admin_fail = Card.where(status: 2).order('updated_at DESC')
    @card_admin_success = Card.where(status: 3).order('updated_at DESC')
    @card_brand_fail = Card.where(status: 4).order('updated_at DESC')
    @card_brand_success = Card.where(status: 5).order('updated_at DESC')
  end

  def create
    @active = params[:active]
    if @active.present?
      @active.each do |i|
        @connect = Connection.find_by id: i
        if current_user.type_user == 0
          @connect.update_attributes(seen: 0)
        elsif current_user.type_user == 1
          @connect.update_attributes(seen: 2)
        end
      end
    end
    redirect_to notifies_path
  end
end
