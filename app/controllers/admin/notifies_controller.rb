class Admin::NotifiesController < ApplicationController
  before_action :user_signin
  before_action :user_actived
  before_action :admin

  def index
    @card_send = Card.where(status: 1).order('updated_at DESC')
    @card_active = Card.where(status: 5).order('updated_at DESC')
    @card_not_active = Card.where(status: 4).order('updated_at DESC')
  end
end
