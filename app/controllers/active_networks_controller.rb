class ActiveNetworksController < ApplicationController
  def index
    @actives = Connection.where("brand_following_id = ? and status=0",
      current_user.brand.id)
  end

  def create
    @active = params[:active]
    if @active.present?
      @active.each do |i|
        @connect = Connection.find_by id: i
        @connect.update_attributes(status: 1)
      end
    end
    redirect_to active_networks_path
  end
end
