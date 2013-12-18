class ApiController < ApplicationController
  class UserNotFoundError < StandardError
  end

  before_action :get_user
  respond_to :json

  rescue_from ActiveRecord::RecordNotFound do |e|
    render json: {error: 'Not found'}, status: 404
  end

  rescue_from UserNotFoundError do |e|
    render json: {error: 'Not logged in'}, status: 401
  end

  protected
  def get_user
    @user = current_user
    unless @user
      raise UserNotFoundError
    end
  end

  def get_default_list
    @user.lists.find_or_create_by(name: 'default')
  end
end
