require 'rails_helper'

RSpec.describe Group, type: :model do
  describe 'Group model' do
    before(:each) do
      @user = User.create(name: 'Nat', email: 'nat@mv.com', password: '123456')
      @group = Group.create(name: 'Dev group', icon: 'dev.png', user_id: @user)
    end

    it 'validates name' do
      @group.name = ''
      expect(@group).to_not be_valid
    end

    it 'validates icon' do
      @group.icon = ''
      expect(@group).to_not be_valid
    end

    it 'validates author' do
      @group.user = nil
      expect(@group).to_not be_valid
    end
  end
end
