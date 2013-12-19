class LinksController < ApiController
  before_action :get_user

  def index
    @links = get_default_list.link_lists
  end

  def create
    @link = Link.find_or_create_by(url: params[:url])
    @link_list = get_default_list.link_lists.create(link_id: @link.id)
    render_link
  end

  def destroy
    @link_list = get_default_list.link_lists.find(params[:id])
    @link_list.destroy! if @link_list
    render_link
  end

  def update
    @link_list = get_default_list.link_lists.find(params[:id])
    @link_list.update_attributes!(read_at: Time.now) if @link_list && @link_list.read_at.nil?
    render_link
  end

  private
  def render_link
    render "links/show"
  end
end
