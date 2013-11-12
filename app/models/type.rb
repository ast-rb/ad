class Type < ActiveRecord::Base
   attr_accessible :name
   has_many :ads
   validates :name, presence: true




  # For Ransack
  UNRANSACKABLE_ATTRIBUTES = ['id', 'created_at', 'updated_at' ]
  def self.ransackable_attributes auth_object = nil
    (column_names - UNRANSACKABLE_ATTRIBUTES) + _ransackers.keys
  end

end
