require 'test_helper'

class AdTest < ActiveSupport::TestCase


  # Тестируем связи:
  should have_many(:images)
  should belong_to(:type)
  should belong_to(:user)

  # Тестируем валидацию
  should validate_presence_of(:title)
  should validate_presence_of(:body)

  # Нужно протестировать удаление Ad, и так же созависимые с ней картинки.


  # Содержат изображения
  test 'should contain images' do
    ad = ads(:one)
    assert_equal [images(:one_1), images(:one_2)], ad.images
  end




end
