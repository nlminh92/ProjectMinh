class Admin::ActivitiesController < ApplicationController
  before_action :user_signin
  before_action :user_actived
  # before_action :admin

  def index
    if current_user.type_user == 2
      @active_user = User.where("type_user <> ? and activated = ?", 2, true).order('updated_at DESC')
      @array = [2,3,4,5]
      @active_card = Card.where("status in (?)", @array).order('updated_at DESC')
    end

    if current_user.type_user == 3
      @active_user = User.joins(:brand).where("brands.showroom_id = ? and accept = 1", current_user.showroom_id)
                         .order('updated_at DESC')
      @array = [2,3,4,5]
      @active_card = Card.joins(:brand).where("status in (?)", @array).order('updated_at DESC')
                          .where("brands.showroom_id = ? and accept = 1", current_user.showroom_id)
    end
  end

end
