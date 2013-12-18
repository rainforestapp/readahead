require 'spec_helper'

describe ListsController do
  render_views

  describe "GET 'index'" do
    describe "with no data" do
      let!(:user) { create :user, email: 'test@test.com' }
    
      it "returns an empty array " do
        get 'index', format: :json
        response.should be_success
        JSON.parse(response.body).should == []
      end
    end

    describe "with lists" do
      let!(:list) { create :list, name: 'simons list' }

      it "returns the expected stuff" do
        get 'index', format: :json
        response.should be_success
        JSON.parse(response.body).should == [{'id' => list.id, 'name' => list.name}]
      end
    end
  end

  describe "GET 'show'" do
    describe "with no data" do
      let!(:user) { create :user, email: 'test@test.com' }
    
      it "returns an empty array " do
        get 'show', id: 1, format: :json
        response.should_not be_success
      end
    end

    describe "with lists" do
      let(:list) { create :list, name: 'simons list' }

      it "returns the expected stuff" do
        get "show", id: list.id, format: :json
        response.should be_success
        assigns(:list).should == list
        JSON.parse(response.body).should == {'id' => list.id, 'name' => list.name}
      end
    end
  end

  describe "GET 'create'" do
    let!(:user) { create :user, email: 'test@test.com' }
    let(:list_name) { 'simon test' }

    it "returns http success" do
      post 'create', name: list_name, format: :json
      response.should be_success
      assigns(:list).should be_an(List)
      JSON.parse(response.body)['name'].should == list_name
    end
  end

  describe "GET 'update'" do
    xit "returns http success" do
      get 'update'
      response.should be_success
    end
  end

  describe "DELETE list" do
    let(:list) { create :list, name: 'simons list' }

    it "returns http success" do
      delete 'destroy', id: list.id, format: :json
      response.should be_success
      List.where(id: list.id).count.should == 0
    end
  end

end
