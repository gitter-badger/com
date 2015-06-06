class Mission < ActiveRecord::Base
  has_many :deliverables
end
