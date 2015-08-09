require 'rails_helper'

RSpec.describe Mission, type: :model do
  describe("validations") do
    it("validates name") do
      mission = Mission.new
      expect(mission.valid?).to be(false)
      expect(mission.errors[:name]).to_not be_empty
    end
  end
end
