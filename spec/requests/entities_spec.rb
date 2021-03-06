require 'rails_helper'

RSpec.describe 'Groups', type: :request do
  describe 'GET entities' do
    before(:each) do
      @user = User.create(name: 'Nat', email: 'nat@mv.com', password: '123456')
      @group = Group.create(name: 'Dev group', icon: 'dev.png', user_id: @user)
      @entity = Entity.create(name: 'Dev entity', amount: 200, user_id: @user, group_id: @group)

      post user_session_path, params: { user: { email: @user.email, password: @user.password } }
      get entities_path
    end

    it 'has a 200 success status code' do
      expect(response).to have_http_status(200)
    end
    it 'If a correct template was rendered' do
      expect(response).to render_template(:index)
    end
  end

  describe 'New entity' do
    before(:each) do
      @user = User.create name: 'Nat', email: 'nat@mv.com', password: '123456'
      @group = Group.create name: 'Dev group', icon: 'dev.png', user_id: @user
      @entity = Entity.create name: 'Dev entity', amount: 200, user_id: @user, group_id: @group

      post user_session_path, params: { user: { email: @user.email, password: @user.password } }
      get new_entity_path
    end

    it 'has a 200 success status code' do
      expect(response).to have_http_status(200)
    end
    it 'If a correct template was rendered' do
      expect(response).to render_template(:new)
    end
  end
end
