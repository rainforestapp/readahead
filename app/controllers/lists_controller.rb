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
    @list = get_list(params[:id])
  end

  def create
    @list = @user.lists.create(name: params[:name])
    render "lists/show"
  end

  def update
    @list = get_list(params[:id])
    @list.update_attributes! name: params[:name]
    render "lists/show"
  end

  def destroy
    @list = @user.lists.find(params[:id])
    @list.destroy!
    render "lists/show"
  end

  private
  def get_list(id)
    @user.lists.find(id)
  end

  def get_user
    @user = User.first
  end
end
