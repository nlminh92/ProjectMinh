class CollectionBrandController < ApplicationController
  before_action :user_signin
  before_action :user_actived

  def show
    @brand = Brand.find_by id: params[:id]
    @collections = Collection.where("brand_id=? and status=1", @brand.id)
  end

end
