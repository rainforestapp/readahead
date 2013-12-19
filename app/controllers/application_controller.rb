class ApplicationController < ActionController::Base
  def current_user
    User.find(request.session[:user_id])
  end

  def current_user=(user)
    request.session[:user_id] = user.id
  end
end
