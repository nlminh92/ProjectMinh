class ConnectionsController < ApplicationController
  def index
    @follower = Connection.where(brand_follow_id: current_user.brand.id)
    @following = Connection.where(brand_following_id: current_user.brand.id)
    @array_id = []
    @follower.each do |i|
      @array_id << i.brand_following_id
    end

    @following.each do |i|
      @array_id << i.brand_follow_id
    end
    @array_id << current_user.brand.id
    @brand = Brand.where('id NOT IN (?)',@array_id)
  end

  def create
    if params[:brand].length != 0
      params[:brand].each do |id|
        Connection.create(brand_follow_id: current_user.brand.id,
          brand_following_id: id, status: 0)
      end
    end
    redirect_to connections_url
  end
end
