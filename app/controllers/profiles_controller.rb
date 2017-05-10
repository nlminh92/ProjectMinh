class ProfilesController < ApplicationController
  def index
    @profile = current_user
  end

  def show
    @profile = User.find_by(brand_id: params[:id])
    if @profile.blank?
      @profile = User.find_by(retailler_id: params[:id])
    end
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
