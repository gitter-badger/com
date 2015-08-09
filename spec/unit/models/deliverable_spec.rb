require "rails_helper"

RSpec.describe(Deliverable, { type: :model }) do
  it("defaults ordering to 0") do
    deliverable = Deliverable.create!({ name: "clean gotham's streets" , description: "18 months clean streets, think what you can do with that!" })
    expect(deliverable.ordering).to eq(0)
  end

  it("validates name") do
    deliverable = Deliverable.new
    expect(deliverable.valid?).to be_falsy
    expect(deliverable.errors.keys).to include(:name)
    expect(deliverable.errors[:name]).to include("can't be blank")
  end
end

