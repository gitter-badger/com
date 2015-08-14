require "rails_helper"

RSpec.describe(Deliverable, { type: :model }) do
  it("defaults ordering to 0") do
    mission = Mission.create!({ name: Faker::Name.name })
    deliverable = Deliverable.create!({
      mission: mission,
      name: "clean gotham's streets",
      value: "18 months clean streets, think what you can do with that!"
    })
    expect(deliverable.ordering).to eq(0)
  end

  describe("validations") do
    it("requires name") do
      deliverable = Deliverable.new
      expect(deliverable.valid?).to be_falsy
      expect(deliverable.errors.keys).to include(:name)
      expect(deliverable.errors[:name]).to include("can't be blank")
    end

    it("requires mission") do
      deliverable = Deliverable.new
      expect(deliverable.valid?).to be_falsy
      expect(deliverable.errors.keys).to include(:mission)
      expect(deliverable.errors[:mission]).to include("can't be blank")
    end
  end
end

