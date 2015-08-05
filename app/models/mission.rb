class Mission < ActiveRecord::Base
  validates(:name, { presence: true })

  has_many(:deliverables, -> { order "ordering DESC" })
end
