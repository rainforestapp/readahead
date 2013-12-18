class ListsController < ApiController
  before_action :get_user
  before_action :get_list, only: %w(show update destroy)
  
  def index
    @lists = @user.lists
  end

  def show
  end

  def create
    @list = @user.lists.create(name: params[:name])
    render_list
  end

  def update
    @list.update_attributes! name: params[:name]
    render_list
  end

  def destroy
    @list.destroy!
    render_list
  end

  private
  def get_list
    @list = @user.lists.find(params[:id])
  end

  def render_list
    render "lists/show"
  end
end
