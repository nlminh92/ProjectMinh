class Admin::ActivesController < ApplicationController
  before_action :user_signin
  before_action :user_actived
  before_action :admin

  def index
    @users = User.all
  end

  def create
    @users = User.all
    @users.each do |user|
      @name_params = 'user_' + user.id.to_s
      @tmp = @name_params.parameterize.underscore.to_sym
      user.update_attributes(activated: params[@tmp])
    end
     flash[:success] = "Active user success"
    redirect_to admin_actives_path
  end

end
