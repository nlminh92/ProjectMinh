class ProductBrandController < ApplicationController
  before_action :user_signin
  before_action :user_actived
  skip_before_filter :verify_authenticity_token


  def show
    @collection = Collection.find_by id: params[:id]
    @products = Product.where("collection_id=? and active=?", @collection.id, true)
    @brand = @collection.brand
    @card = Card.find_by(brand_id: @brand.id, retailler_id: current_user.retailler.id,
      status: 0)
    @check = false
    if @card.present?
      @check = true
      flash[:success] = "You have card in this brand. You can order product"
    else
      flash[:success] = "You don't have card in this brand. You must create first"
    end
  end

  def create
    @brand_id = params[:id]
    @card = Card.find_by(brand_id: @brand_id, retailler_id: current_user.retailler.id,
      status: 0)
    @product = Product.find_by id: params[:product]
    @price = @product.price
    @total = @card.total
    if @total.nil?
      @total = @price * params[:number].to_i
    else
      @total = @total + @price * params[:number].to_i
    end
    @all_total = @total + @total*@card.shipping/100
    @card.update_attributes(total: @total, all_total: @all_total)
    Order.create(number: params[:number], price: @price,
      product_id: params[:product], card_id: @card.id)
    redirect_to cart_url(@card.id)
  end
end
