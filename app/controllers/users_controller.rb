class UsersController < ApplicationController
  respond_to :json

  def login
    self.current_user = User.find_or_create_by(email: params[:email])
  end
end