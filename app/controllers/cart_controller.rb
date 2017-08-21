class CartController < ApplicationController
  before_action :user_signin
  before_action :user_actived

  def show
    @card = Card.find_by id: params[:id]
    @orders = @card.orders
  end

  def destroy
    @card = Card.find_by id: params[:id]
    if @card.destroy
      flash[:success] = "Delete success"
    else
      flash[:danger] = "Delete fails"
    end
    redirect_to my_orders_path
  end
end
