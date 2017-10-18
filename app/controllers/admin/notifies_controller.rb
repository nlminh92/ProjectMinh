class Admin::NotifiesController < ApplicationController
  before_action :user_signin
  before_action :user_actived
  before_action :admin

  def index
    @card_send = Card.joins(:brand).where(status: 1).order('updated_at DESC')
                      .where("brands.showroom_id = ? and accept = 1", current_user.showroom_id)
    @card_active = Card.joins(:brand).where(status: 5).order('updated_at DESC')
                        .where("brands.showroom_id = ? and accept = 1", current_user.showroom_id)
    @card_not_active = Card.joins(:brand).where(status: 4).order('updated_at DESC')
                           .where("brands.showroom_id = ? and accept = 1", current_user.showroom_id)
  end
end
