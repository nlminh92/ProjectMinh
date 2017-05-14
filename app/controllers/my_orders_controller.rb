class MyOrdersController < ApplicationController
  before_action :user_signin
  before_action :user_actived
  skip_before_filter :verify_authenticity_token

  def index
    @carded = Card.where(retailler_id: current_user.retailler.id,
      status: 5, pay: nil)
    @carded_pay = Card.where(retailler_id: current_user.retailler.id,
      status: 5, pay: 1)
    @array_2 = [0 , 3]
    @caring = Card.where("retailler_id = ? and status in (?)", current_user.retailler.id,
      @array_2)
    @array = [1]
    @carings = Card.where("retailler_id = ? and status in (?)", current_user.retailler.id,
      @array)
  end

  def create
    @card = Card.find_by(id: params[:card])
    @card.update_attributes(status: 1)
    flash[:success] = "Wait for admin accept"
    redirect_to my_orders_url
  end
end
