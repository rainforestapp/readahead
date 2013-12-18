class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def current_user
    User.find(request.session[:user_id])
  end

  def current_user=(user)
    request.session[:user_id] = user.id
  end
end
