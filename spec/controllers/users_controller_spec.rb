require 'spec_helper'

describe UsersController do
  render_views

  let(:new_user) do
    create :user
  end

  describe 'login' do
    let(:email) { 'asdfdsfdfdsfsdf@rainforest.com' }

    it 'can create a new user' do
      post 'login', email: email, format: :json
      response.should be_success
      puts response.body
      expect(session[:user_id]).to eq(User.find_by(email: email).id)
      expect(JSON.parse(response.body)).to eq('success' => true)
    end

    it 'can login an existing user' do
      post 'login', email: new_user.email, format: :json
      response.should be_success
      puts response.body
      expect(session[:user_id]).to eq(User.find_by(email: new_user.email).id)
      expect(JSON.parse(response.body)).to eq('success' => true)
    end
  end
end