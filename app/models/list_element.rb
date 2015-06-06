class ListElement < ActiveRecord::Base
  belongs_to :user
  attr_accessible :literature,:user_id
end
