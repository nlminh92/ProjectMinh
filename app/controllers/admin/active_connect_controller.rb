class Admin::ActiveConnectController < ApplicationController
  before_action :user_signin
  before_action :user_actived
  before_action :admin

  def index
    @brands = Brand.where(showroom_id: current_user.showroom_id)
                  .where("accept is null")
  end
  
  def create
    status_and_id = params[:accept].split("_")
    # byebug
    brand = Brand.find_by(id: status_and_id[1])
    if status_and_id[0].to_i == 1
      brand.update_attributes(accept: 1)
    else
      showroom = Showroom.find_by(id: brand.showroom_id)
      showroom.update_attributes(number: showroom.number - 1)
      brand.update_attributes(showroom_id: nil, accept: nil)
    end
    redirect_to admin_active_connect_index_path
  end
end
