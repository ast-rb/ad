class Ad < ActiveRecord::Base
    attr_accessible :title, :body, :type_id, :user_id
  belongs_to :type
  belongs_to :user
end
