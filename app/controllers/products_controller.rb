class ProductsController < ApplicationController
  before_action :user_signin
  before_action :user_actived
  # skip_before_action :verify_authenticity_token
  skip_before_filter :verify_authenticity_token
  def index
    @products = Product.all
  end

  def new
    @product_types = Producttype.all
    @sell_types = Selltype.all
  end

  def show
    @product = Product.find_by id: params[:id]
  end

  def create
    @product = Product.new
    @product.name_products = params[:name_products]
    @product.image = params[:picture]
    @product.season = params[:session]
    @product.supplier_sku = params[:supplier_sku]
    @product.code = params[:code]


    @product.save
    redirect_to @product
  end
end
