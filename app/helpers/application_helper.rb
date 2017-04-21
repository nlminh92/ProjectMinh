module ApplicationHelper
  def user_signin_active
    if user_signed_in? && (current_user.activated)
      return true
    else
      return false
    end
  end

  def user_signin
    if user_signed_in?
      return true
    else
      return false
    end
  end

  def user_signin_not_active
    if user_signed_in? && (!current_user.activated)
      return true
    else
      return false
    end
  end

  def flash_application flash
    if flash.present?
      flash.each do |message_type, message|
        return content_tag :div, message, class: "alert alert-#{message_type}"
      end
    end
  end

end
