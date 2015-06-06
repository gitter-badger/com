class Mission < ActiveRecord::Base
  has_many :deliverables, -> { order 'ordering ASC' }
end
