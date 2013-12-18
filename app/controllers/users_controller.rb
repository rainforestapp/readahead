class UsersController < ApplicationController
  protect_from_forgery :except => :login
  respond_to :json

  def login
    self.current_user = User.find_or_create_by(email: params[:email])
  end
end