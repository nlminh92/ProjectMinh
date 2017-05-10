class ProfilesController < ApplicationController
  before_action :user_signin
  def index
    @profile = current_user
  end

  def show
    @profile = User.find_by(id: params[:id])
  end

  def edit
    @profile = current_user
  end

  def update
    current_user.update_attributes(profile_params)
    redirect_to profiles_path
  end

  private

  def profile_params
    params.permit :avatar, :company, :website, :address, :zip_code, :country,
      :firstname_contact, :lastname_contact, :phone, :description
  end
end
