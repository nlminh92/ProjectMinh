class ProductsController < ApplicationController
  before_action :user_signin
  before_action :user_actived
  # skip_before_action :verify_authenticity_token
  skip_before_filter :verify_authenticity_token
  def index
    if current_user.type_user = Settings.brand
      @products_index = Product.where(brand_id: current_user.brand.id)
    elsif current_user.type_user = Settings.retailler
      @products_index = Product.where(brand_id: current_user.brand.id)
    end
    if params[:search]
      @products = Product.search(params[:search]).order("created_at DESC")
    else
      @products = @products_index
    end
  end


  def new
    @product_types = Producttype.all
    @sell_types = Selltype.all
  end


  def edit
    @product_types = Producttype.all
    @sell_types = Selltype.all
    @product = Product.find_by id: params[:id]
    @size = JSON.parse(@product.size)
  end

  def update
    @product = Product.find_by id: params[:id]
    @product.update_attributes(product_params)
    redirect_to product_path(params[:id])
  end

  def show
    @product = Product.find_by id: params[:id]
  end

  def create
    @product = Product.new
    if current_user.type_user = Settings.brand
      @product.brand_id = current_user.brand.id
    elsif current_user.type_user = Settings.retailler
      @product.brand_id = current_user.brand.id
    end
    @product.type_sell =  params[:sell_type]
    @product.active = params[:active_product]
    @product.name_products = params[:name_products]
    @product.image = params[:picture]
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

  private

  def product_params
    params.permit :type_sell, :name_products, :image, :code, :price, :season, :supplier_sku, :gender, :size, :description
  end
end
