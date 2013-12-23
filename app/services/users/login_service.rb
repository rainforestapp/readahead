module Users
  class LoginService
    def initialize(request)
      @request = request
    end

    def current_user
      User.find(@request.session[:user_id])
    end

    def current_user=(user)
      @request.session[:user_id] = user ? user.id : nil
    end
  end
end