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
