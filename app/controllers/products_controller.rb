class ProductsController < ApplicationController
  before_action :user_signin
  before_action :user_actived
  # skip_before_action :verify_authenticity_token
  skip_before_filter :verify_authenticity_token
  def index
    @products = Product.all
    if params[:search]
    @products = Product.search(params[:search]).order("created_at DESC")
  else
    @products = Product.all.order('created_at DESC')
  end
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
    @product.price = params[:price]
    @product.gender = params[:gender]
    @product.season = params[:season]
    @product.size = params[:size]
    @product.description = params[:description]

    @product.save
    redirect_to @product
  end
end
