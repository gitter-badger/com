class Requirement < ActiveRecord::Base
  belongs_to :deliverable
  validates :name, { presence: true }
  validates :deliverable, { presence: true }

  before_validation :set_defaults

  def set_defaults
    self.ordering ||= 0
  end
end
