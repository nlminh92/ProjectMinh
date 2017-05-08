class ProfilesController < ApplicationController
  def index
    if current_user.type_user = Settings.brand
      @profile = current_user.brand
    elsif current_user.type_user = Settings.retailler
      @profile = current_user.brand
    end
  end

  def show
    @profile = Brand.find_by(id: params[:id])
  end

  def edit
    if current_user.type_user = Settings.brand
      @profile = current_user.brand
    elsif current_user.type_user = Settings.retailler
      @profile = current_user.brand
    end
  end

  def update
    if current_user.type_user = Settings.brand
      @profile = current_user.brand
    elsif current_user.type_user = Settings.retailler
      @profile = current_user.brand
    end
    @profile.update_attributes(profile_params)
    redirect_to profiles_path
  end

  private

  def profile_params
    params.permit :logo, :name, :description, :facebook, :instagram
  end
end
