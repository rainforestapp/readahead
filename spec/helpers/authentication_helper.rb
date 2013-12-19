module AuthenticationHelper
  def login_user(user)
    session[:user_id] = user.id
  end

  def logout
    session[:user_id] = nil
  end
end