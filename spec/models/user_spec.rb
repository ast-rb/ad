require 'spec_helper'

describe User do

  it 'create user with user role' do
    role = Role.create(name: 'user')
    user = FactoryGirl.create(:user)
    user.role.should === role
  end

  it 'method role? should return user role' do
    role = Role.create(name: 'user')
    user = FactoryGirl.create(:user)
    user.role?(:user).should be_true
  end

end