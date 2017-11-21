class HomepagebrandController < ApplicationController

  def show
    @users = User.joins(:brand)
                 .where(activated: true)
                 .where("brands.showroom_id = ? and brands.accept = 1", params[:id])

  end
end
