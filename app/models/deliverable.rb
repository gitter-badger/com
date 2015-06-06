class Deliverable < ActiveRecord::Base
  belongs_to :mission

  before_validation :set_defaults

  def set_defaults
    self.ordering ||= 0
  end
end
