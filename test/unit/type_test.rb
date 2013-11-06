require 'test_helper'

class TypeTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  should validate_presence_of(:name)

  have_many(:ad)

  test 'should contain ads' do
     t = types(:sell)
     assert_equal [ads(:one), ads(:two)], t.ads
  end
end
