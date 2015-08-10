require 'rails_helper'

RSpec.describe "deliverables/show", type: :view do
  before(:each) do
    @mission = Mission.create!({ name: Faker::Name.name })
    @deliverable = assign(:deliverable, Deliverable.create!({
      mission: @mission,
      name: Faker::Name.name
    }))
  end

  it "renders attributes in <p>" do
    render
  end
end
