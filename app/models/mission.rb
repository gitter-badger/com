class Mission < ActiveRecord::Base
  has_many(:deliverables, -> { order "ordering DESC" })
end
