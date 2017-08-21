class CollectionBrandController < ApplicationController
  before_action :user_signin
  before_action :user_actived
  skip_before_filter :verify_authenticity_token

  def show
    @card = Card.find_by(brand_id: params[:id], retailler_id: current_user.retailler.id,
      status: 0)
    @check = true
    if @card.present?
      @check = false
      flash[:success] = "You have card in this brand. You can order product"
    end
    @brand = Brand.find_by id: params[:id]
    @collections = Collection.where("brand_id=? and status=?", @brand.id, true)
  end

  def create
    @card = Card.new(brand_id: params[:id],
      retailler_id: current_user.retailler.id, total: 0,
      count: 0, all_total: 0,
      status: 0, shipping: 5.0)
    @card.save
    redirect_to collection_brand_path(@card.brand_id)
  end

end
