class Deliverable < ActiveRecord::Base
  belongs_to(:mission)
  has_many(:requirements, -> { order "ordering DESC" })
  before_validation(:set_defaults)
  validates :name, { presence: true }
  validates :mission, { presence: true }

  def set_defaults
    self.ordering ||= 0
  end
end
