class ApplicationController < ActionController::Base
  include ApplicationHelper
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def user_signin
    if user_signed_in?
      return true
    else
      redirect_to root_path
    end
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) do |user_params|
      user_params.permit(:email, :password, :password_confirmation, :type_user,
      :website, :address, :zip_code, :country, :firstname_contact, :lastname_contact, :phone, :description)
    end 
  end

end
