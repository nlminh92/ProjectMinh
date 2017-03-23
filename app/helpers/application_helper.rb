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

end
