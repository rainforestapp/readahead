class ApplicationController < ActionController::Base
  helper_method :login_service, :login_service=
  delegate :current_user, :current_user=, to: :login_service

  def login_service
    @login_service || Users::LoginService.new(request)
  end

  def login_service=(service_klass)
    @login_service = service_klass
  end
end
