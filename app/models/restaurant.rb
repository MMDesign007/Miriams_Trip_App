class Restaurant < ActiveRecord::Base
  belongs_to :destination
  has_many   :reviews
end
