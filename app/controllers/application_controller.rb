class ApplicationController < ActionController::Base
  include ApplicationHelper
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  after_action :create_brand, only: :create , if: :devise_controller?

  protected

  def user_signin
    if user_signed_in?
      return true
    else
      redirect_to root_path
    end
  end

  def user_actived
    unless current_user.activated
      redirect_to homes_path
    end
  end 

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) do |user_params|
      user_params.permit(:email, :password, :password_confirmation, :type_user,:company,
      :website, :address, :zip_code, :country, :firstname_contact, :lastname_contact, :phone, :description)
    end 
  end

  def create_brand
   if params[:user][:type_user] == Settings.brand
     @brand = Brand.new(name: params[:user][:company])
     @brand.save
     current_user.update_attributes(brand_id: @brand.id)
   elsif params[:user][:type_user] == Settings.retailler
     @retailler = Brand.new(name: params[:user][:company])
     @retailler.save
     current_user.update_attributes(retailler_id: @retailler.id)
   end
  end

end
