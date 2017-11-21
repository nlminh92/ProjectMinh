class LookbooksController < ApplicationController
  before_action :user_signin
  before_action :user_actived
  # skip_before_action :verify_authenticity_token
  skip_before_filter :verify_authenticity_token

  def index
    if current_user.type_user == 0
      @collections = Collection.where("brand_id=?", current_user.brand.id).order('created_at DESC')
    elsif current_user.type_user == 1
      @collections = Collection.where("retailler_id=?", current_user.brand.id).order('created_at DESC')
    end
  end

end
