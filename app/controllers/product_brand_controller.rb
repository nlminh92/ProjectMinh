class ProductBrandController < ApplicationController
  before_action :user_signin
  before_action :user_actived
  skip_before_filter :verify_authenticity_token


  def show
    @collection = Collection.find_by id: params[:id]
    @products = Product.where("collection_id=? and active=1", @collection.id)
  end

  def create
    @collection = Collection.find_by id: params[:id]
    @brand = Brand.find_by id: @collection.id
    @card = Card.new(brand_id: @brand.id, retailler_id: current_user.retailler.id)
    @card.save
    redirect_to card_path(@card.id)
  end
end
