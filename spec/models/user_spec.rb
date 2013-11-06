require 'spec_helper'

describe User do

  it 'create user with user role' do
    role = Role.create(name: 'user')
    user = FactoryGirl.create(:user)
    user.roles.should include(role)
  end

  it 'method role?' do
    role = Role.create(name: 'user')
    user = FactoryGirl.create(:user)
    user.role?(:user).should be_true
  end

end