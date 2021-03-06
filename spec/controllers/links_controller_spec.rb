require 'spec_helper'

describe LinksController do
  let!(:user) { create :user }
  let(:list) { create :list, :with_links, user: user }
  let(:link) { create :link }
  let(:json) { JSON.parse(response.body) }

  before(:each) do
    login_user(user)
  end

  describe "GET 'index'" do
    describe "no links" do
      it "returns http success" do
        get 'index', format: :json
        json.should == []
        response.should be_success
      end
    end

    describe "no links" do
      it "returns http success" do
        link
        get 'index', format: :json
        json.should == []
        response.should be_success
      end
    end
  end

  describe "POST 'create'" do
    it "creates the link" do
      expect {
        post 'create', url: 'http://www.rainforestqa.com/', format: :json
        response.should be_success
      }.to change{Link.count}.from(0).to(1)
    end

    it "doesn't create exisiting links" do
      list
      expect {
        post 'create', url: list.links.first.url, format: :json
        response.should be_success
      }.to_not change{Link.count}.from(1)
    end
  end

  describe "DELETE 'destroy'" do
    it "returns http success" do
      list
      id = list.link_lists.first.id
      expect {
        delete 'destroy', id: id, format: :json
        response.should be_success
      }.to change{LinkList.count}.from(1).to(0)
    end
  end

  describe "PUT 'update'" do
    it "updates the timestamp" do
      list
      link_list = list.link_lists.first
      expect {
        put 'update', id: link_list.id, format: :json
        response.should be_success
      }.to change{link_list.reload.read_at.to_i}.from(0).to(Time.now.to_i)
    end
  end
end
