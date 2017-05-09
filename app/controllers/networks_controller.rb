class NetworksController < ApplicationController

  def index
    @connected = Connection.where("brand_follow_id = ? and status=1",
      current_user.brand.id)
    @connecter = Connection.where("brand_following_id = ? and status=1",
      current_user.brand.id)
    @connecting = Connection.where("brand_follow_id = ? and status = 0", current_user.brand.id)
  end
end
