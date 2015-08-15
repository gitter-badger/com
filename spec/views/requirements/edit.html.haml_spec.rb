require 'rails_helper'

RSpec.describe "requirements/edit", type: :view do
  before(:each) do
    @mission = Mission.create!({ name: Faker::Name.name })
    @deliverable = @mission.deliverables.create!(name: Faker::Name.name)
    @requirement = assign(:requirement, @deliverable.requirements.create!(name: Faker::Name.name))
  end

  it "renders the edit requirement form" do
    render

    assert_select "form[action=?][method=?]", mission_deliverable_requirement_path(@mission, @deliverable, @requirement), "post" do
    end
  end
end
