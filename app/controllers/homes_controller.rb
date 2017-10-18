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
  end
end
