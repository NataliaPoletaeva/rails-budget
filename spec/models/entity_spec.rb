require 'rails_helper'

RSpec.describe Entity, type: :model do
  describe 'Entity model' do
    before(:each) do
      @user = User.create(name: 'Nat', email: 'nat@mv.com', password: '123456')
      @group = Group.create(name: 'Dev group', icon: 'dev.png', user_id: @user)
      @entity = Entity.create(name: 'Dev entity', amount: 200, user_id: @user, group_id: @group)
    end

    it 'validates name' do
      @entity.name = ''
      expect(@entity).to_not be_valid
    end

    it 'validates amount' do
      @entity.amount = ''
      expect(@entity).to_not be_valid
    end

    it 'validates author' do
      @entity.user = nil
      expect(@entity).to_not be_valid
    end

    it 'validates group' do
      @entity.group = nil
      expect(@entity).to_not be_valid
    end
  end
end
