require 'rails_helper'

RSpec.describe "requirements/new", type: :view do
  before(:each) do
    @mission = Mission.create!(name: Faker::Name.name)
    @deliverable = @mission.deliverables.create!(name: Faker::Name.name)
    assign(:requirement, Requirement.new())
  end

  it "renders new requirement form" do
    render

    assert_select "form[action=?][method=?]", mission_deliverable_requirements_path(@mission, @deliverable, { action: :create }), "post" do
    end
  end
end
