class ProductsController < ApplicationController
  before_action :user_signin
  before_action :user_actived
  skip_before_action :verify_authenticity_token
  def index
  end

  def new
    @product_types = Producttype.all
    @sell_types = Selltype.all
  end

  def create
    byebug
  end
end
