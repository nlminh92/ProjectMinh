class CollectionsController < ApplicationController
  before_action :user_signin
  before_action :user_actived
  # skip_before_action :verify_authenticity_token
  skip_before_filter :verify_authenticity_token

  def index
    if current_user.type_user == 0
      @collections = Collection.where("brand_id=?", current_user.brand.id).order('created_at DESC')
    elsif current_user.type_user == 1
      @collections = Collection.where("retailler_id=?", current_user.brand.id).order('created_at DESC')
    end
  end

  def show
    @collection = Collection.find_by id: params[:id]
    @product = Product.where(collection_id: params[:id])
  end

  def edit
    @collection = Collection.find_by id: params[:id]
    @product = Product.where(collection_id: params[:id])
    @id = @product.pluck(:id)
    if @id.length != 0
      @product_2 = Product.where("collection_id is null and id NOT IN (?)", @id)
    else
      @product_2 = Product.where("collection_id is null")
    end
  end

  def update
    @product = Product.where(collection_id: params[:id])
    @product.each do |i|
      i.update_attributes(collection_id: nil)
    end
    @collection = Collection.find_by id: params[:id]
    @collection.update_attributes(name_collections: params[:title],
      image: params[:picture],
      status: params[:optradio],
      description: params[:description],
      date_availability: params[:available])
    @products = params[:products]
    @products.each do |i|
      product = Product.find_by(id: i)
      product.update_attributes(collection_id: params[:id])
    end
    redirect_to collection_path(params[:id])
  end

  def new
    if current_user.type_user == 0
      @product = Product.where("brand_id=? and active=1 and collection_id is null", current_user.brand.id)
    elsif current_user.type_user == 1
      @product = Product.where("retailler_id=? and active=1 and collection_id is null", current_user.retailler.id)
    end
  end

  def create
    @colection = Collection.new
    @colection.name_collections = params[:title]
    @colection.image = params[:picture]
    @colection.status = params[:optradio]
    @colection.description = params[:description]
    @colection.date_availability = params[:available]
    @colection.lookbook = params[:lookbook]
    @products = params[:products]
    if current_user.type_user == 0
      @colection.brand_id = current_user.brand.id
    elsif current_user.type_user == 1
      @colection.retailler_id = current_user.retailler.id
    end

    @colection.save

    @products.each do |i|
      product = Product.find_by(id: i)
      product.update_attributes(collection_id: @colection.id)
    end
    redirect_to @colection
  end
end
