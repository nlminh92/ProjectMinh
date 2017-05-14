class ConnectionsController < ApplicationController
  before_action :user_signin
  before_action :user_actived
  def index
    # @follower = Connection.where(brand_follow_id: current_user.brand.id)
    # @following = Connection.where(brand_following_id: current_user.brand.id)
    # @array_id = []
    # @follower.each do |i|
    #   @array_id << i.brand_following_id
    # end

    # @following.each do |i|
    #   @array_id << i.brand_follow_id
    # end
    # @array_id << current_user.brand.id
    # @brand = Brand.where('id NOT IN (?)',@array_id)
    if current_user.type_user == 1 #retailler
      @connected = current_user.retailler.connections
      @array_id = []
      @connected.each do |i|
        @array_id << i.brand_id
      end
      if @array_id.length != 0
        @retaillers = Brand.where("id NOT IN (?)", @array_id)
      else
        @retaillers = Brand.all
      end
    end

    if current_user.type_user == 0 #brand
      @connected = current_user.brand.connections
      @array_id = []
      @connected.each do |i|
        @array_id << i.retailler_id
      end
      if @array_id.length != 0
        @retaillers = Retailler.where("id NOT IN (?)", @array_id)
      else
        @retaillers = Retailler.all
      end
    end
  end

  def create
    # status: 0 brand sent
    # status: 1 retailler sent
    #status: 2 connect
    if params[:retailler].length != 0
      params[:retailler].each do |id|
        if current_user.type_user == 0
          Connection.create(retailler_id: id,
            brand_id: current_user.brand.id, status: 0)
          flash[:success] = "Sent connect success"
        elsif current_user.type_user == 1
          Connection.create(retailler_id: current_user.retailler.id,
            brand_id: id, status: 1)
          flash[:success] = "Sent connect success"
        end
      end
    end
    redirect_to connections_url
  end

  def destroy
    @connect = Connection.find_by id: params[:id]
    if @connect.destroy
      flash[:success] = "Delete connect success"
    else
      flash[:danger] = "Delete connect fail"
    end
    redirect_to networks_url
  end
end
