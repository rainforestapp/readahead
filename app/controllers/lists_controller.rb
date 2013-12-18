class ListsController < ApplicationController
  before_action :get_user
  respond_to :json

  rescue_from ActiveRecord::RecordNotFound do |e|
    render json: {error: 'Not found'}, status: 404
  end

  def index
    @lists = @user.lists
  end

  def show
    @list = @user.lists.find(params[:id])
  end

  def create
    @list = @user.lists.create(name: params[:name])
    render "lists/show"
  end

  def update
  end

  def destroy
    @list = @user.lists.find(params[:id])
    @list.destroy!
    render "lists/show"
  end

  private
  def get_user
    @user = User.first
  end
end
