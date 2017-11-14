class HomesController < ApplicationController
  before_action :user_signin
  def index
    if current_user.type_user == 1
      if params[:search]
        @products = Product.search(params[:search]).order("created_at DESC")
      else
        @products = Product.all
      end
    end

    if current_user.type_user == 3
      @brands = Brand.where(showroom_id: current_user.showroom_id)
    end
  end
end
