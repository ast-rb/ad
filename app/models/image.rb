class Image < ActiveRecord::Base
  attr_accessible :ad_id, :name, :photo, :_destroy
  belongs_to :ad
  has_attached_file :photo, styles: {mini: '256x256>'}
end
