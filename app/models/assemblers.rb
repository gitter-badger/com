module Assemblers
  class InvalidData < StandardError
    attr_accessor :invalid_attributes

    def initialize(invalid_attributes)
      self.invalid_attributes = invalid_attributes
    end

    def to_s
      "Invalid data for attributes: #{invalid_attributes}"
    end
  end
end
