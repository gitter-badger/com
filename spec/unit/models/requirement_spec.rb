require "rails_helper"

RSpec.describe(Requirement, { type: :model }) do
  it("defaults ordering to 0") do
    mission = Mission.create!({ name: Faker::Name.name })
    deliverable = mission.deliverables.create!(mission: mission, name: "clean gotham's streets")
    requirement = Requirement.create!(deliverable: deliverable,
                                      name: "bring back lau" ,
                                      description: "you just bring him back.. i will make him sing")
    expect(requirement.ordering).to eq(0)
  end

  describe("validations") do
    it("requires name") do
      requirement = Requirement.new
      expect(requirement.valid?).to be_falsy
      expect(requirement.errors.keys).to include(:name)
      expect(requirement.errors[:name]).to include("can't be blank")
    end

    it("requires deliverable") do
      requirement = Requirement.new
      expect(requirement.valid?).to be_falsy
      expect(requirement.errors.keys).to include(:deliverable)
      expect(requirement.errors[:deliverable]).to include("can't be blank")
    end
  end
end

