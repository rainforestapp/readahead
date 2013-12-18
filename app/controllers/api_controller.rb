class ApiController < ApplicationController
  before_action :get_user
  respond_to :json

  rescue_from ActiveRecord::RecordNotFound do |e|
    render json: {error: 'Not found'}, status: 404
  end

  protected
  def get_user
    @user = User.first
  end

  def get_default_list
    @user.lists.find_or_create_by(name: 'default')
  end
end
