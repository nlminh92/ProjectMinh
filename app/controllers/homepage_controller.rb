class HomepageController < ApplicationController


  def index
    @users = User.where(activated: true).where("showroom_id is not null")
  end
end
