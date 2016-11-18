module ApplicationHelper
  def current_user
    User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def admin?
    if current_user
      current_user.administrator?
    else
      false
    end
  end
end
