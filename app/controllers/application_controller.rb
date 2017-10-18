class ApplicationController < ActionController::Base
  include ApplicationHelper
  protect_from_forgery with: :exception,
    if: Proc.new {|c| c.request.format != "application/json"}
  protect_from_forgery with: :null_session,
    if: Proc.new {|c| c.request.format == "application/json"}
  before_action :configure_permitted_parameters, if: :devise_controller?
  after_action :create_brand, only: :create , if: :devise_controller?

  def after_sign_in_path_for(resource)
    homes_path
  end

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

  def admin
    if current_user.activated && current_user.type_user == 3
      @showroom = current_user.showroom_id
    else
      redirect_to homes_path
    end
  end

  def is_admin
    if current_user.activated && current_user.type_user == Settings.admin
      @showroom = current_user.showroom_id
    else
      redirect_to homes_path
    end
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) do |user_params|
      user_params.permit(:email, :password, :password_confirmation, :type_user,:company,
      :website, :address, :zip_code, :country, :firstname_contact, :lastname_contact, :phone, :description, :avatar)
    end
  end

  def create_brand
    if params[:user][:type_user] == Settings.brand
      @brand = Brand.new(name: params[:user][:company])
      @brand.save
      if current_user.present?
        current_user.update_attributes(brand_id: @brand.id)
      end
    elsif params[:user][:type_user] == Settings.retailler
      @retailler = Retailler.new(name: params[:user][:company])
      @retailler.save
      if current_user.present?
       current_user.update_attributes(retailler_id: @retailler.id)
      end
    elsif params[:user][:type_user] == Settings.show_room
      @showroom = Showroom.new(name: params[:user][:company])
      @showroom.save
      if current_user.present?
       current_user.update_attributes(showroom_id: @showroom.id)
      end
    end
  end

end
