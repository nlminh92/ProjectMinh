class NetworksController < ApplicationController
  before_action :user_signin
  before_action :user_actived
  def index
    if current_user.type_user == 0
      @connected = Connection.where("brand_id=? and status = 2", current_user.brand.id)
      @connecter = Connection.where("brand_id=? and status = 0", current_user.brand.id)
      @connecting = Connection.where("brand_id=? and status = 1", current_user.brand.id)
    elsif current_user.type_user == 1
      @connected = Connection.where("retailler_id=? and status = 2", current_user.retailler.id)
      @connecter = Connection.where("retailler_id=? and status = 1", current_user.retailler.id)
      @connecting = Connection.where("retailler_id=? and status = 0", current_user.retailler.id)
    end
  end
end
