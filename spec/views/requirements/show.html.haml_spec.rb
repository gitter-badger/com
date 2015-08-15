require 'rails_helper'

RSpec.describe "requirements/show", type: :view do
  before(:each) do
    @mission = Mission.create!(name: Faker::Name.name)
    @deliverable = @mission.deliverables.create!(name: Faker::Name.name)
    @requirement = assign(:requirement, @deliverable.requirements.create!(name: Faker::Name.name))
  end

  it "renders attributes in <p>" do
    render
  end
end
