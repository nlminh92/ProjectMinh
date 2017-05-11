class Admin::ActivesController < ApplicationController
  before_action :user_signin
  before_action :user_actived
  before_action :admin

  def index
    @users = User.where(activated: 0)
  end

  def create
    @users = User.where(activated: 0)
    @users.each do |user|
      @name_params = 'user_' + user.id.to_s
      @tmp = @name_params.parameterize.underscore.to_sym
      user.update_attributes(activated: params[@tmp])
      if params[@tmp] == "1"
        NotifiUserMailer.send_email(user.email).deliver_now
      end
    end
     flash[:success] = "Active user success"
     redirect_to admin_actives_path
  end

end
