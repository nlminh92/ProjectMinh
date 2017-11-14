class HomepageController < ApplicationController


  def index
    @users = User.where(activated: true).where("brand_id is not null")
  end
end
