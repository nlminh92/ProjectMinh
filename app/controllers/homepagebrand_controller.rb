class HomepagebrandController < ApplicationController
    @users = User.where(activated: true).where("brand_id is not null")
end
