class ActiveNetworksController < ApplicationController
  def index
    if current_user.type_user == 0
      @actives = Connection.where("brand_id = ? and status=1",
        current_user.brand.id)
    elsif current_user.type_user == 1
      @actives = Connection.where("retailler_id = ? and status=0",
        current_user.retailler.id)
    end
  end

  def create
    # brand seened: 0
    # brand not seened: 1
    # retailler seened: 2
    # retailler not seened: 3
    @active = params[:active]
    if @active.present?
      @active.each do |i|
        @connect = Connection.find_by id: i
        if current_user.type_user == 0
          @connect.update_attributes(status: 2, seen: 3)
        elsif current_user.type_user == 1
          @connect.update_attributes(status: 2, seen: 1)
        end
      end
    end
    redirect_to active_networks_path
  end
end
