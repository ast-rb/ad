class Type < ActiveRecord::Base
   attr_accessible :name
   has_many :ads
   validates :name, presence: true
end
