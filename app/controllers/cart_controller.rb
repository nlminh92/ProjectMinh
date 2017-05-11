class CartController < ApplicationController
  before_action :user_signin
  before_action :user_actived

  def show
    @card = Card.find_by id: params[:id]
  end
end
