require 'spec_helper'

describe Ad do

  it 'test validation' do
    should validate_presence_of(:title)
    should validate_presence_of(:body)
    should validate_presence_of(:state)
  end

  it 'test association' do
    should have_many(:images)
    should belong_to(:type)
    should belong_to(:user)
  end

  it 'test nested accepts'







end