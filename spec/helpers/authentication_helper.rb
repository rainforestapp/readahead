module AuthenticationHelper
  def login_user(user)
    set_login_service!
    controller.current_user = user
  end

  def logout
    set_login_service!
    controller.current_user = nil
  end

  def set_login_service!
    unless controller.login_service.is_a?(FakeLoginService)
      controller.login_service = FakeLoginService.new
    end
  end
  private :set_login_service!

  class FakeLoginService
    def initialize(*args)
    end

    def current_user
      @user
    end

    def current_user=(user)
      @user = user
    end
  end
end