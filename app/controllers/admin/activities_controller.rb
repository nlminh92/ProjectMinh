class Admin::ActivitiesController < ApplicationController
  before_action :user_signin
  before_action :user_actived
  before_action :admin

  def index
    @active_user = User.where("type_user <> ? and activated = ?", 2, true).order('updated_at DESC')
    @array = [2,3,4,5]
    @active_card = Card.where("status in (?)", @array).order('updated_at DESC')
  end

end
