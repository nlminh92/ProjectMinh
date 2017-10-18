class ConnectionShowroomsController < ApplicationController
  before_action :user_signin
  before_action :user_actived
  # skip_before_action :verify_authenticity_token
  skip_before_filter :verify_authenticity_token

  def index
    @check = 0 # chua ket noi voi showroom
    if !current_user.brand.showroom_id.nil?
      if !current_user.brand.accept.nil?
        @check = 1 #da accept
      else
        @check = 2
      end
      @showroom = Showroom.find_by(id: current_user.brand.showroom_id)
    else
      @showrooms = Showroom.where("number < 4")
    end
  end

  def create
    if current_user.brand.update_attributes(showroom_id: params[:showroom])
      showroom = Showroom.find_by(id: params[:showroom])
      showroom.update_attributes(number: showroom.number + 1)
      flash[:success] = "Success"
    else
      flash[:danger] = "Error"
    end
    redirect_to connection_showrooms_path
  end
end
