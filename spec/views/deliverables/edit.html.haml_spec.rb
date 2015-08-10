require 'rails_helper'

RSpec.describe "deliverables/edit", type: :view do
  before(:each) do
    @mission = Mission.create!({ name: Faker::Name.name })
    @deliverable = assign(:deliverable, Deliverable.create!({
      mission: @mission,
      name: Faker::Name.name
    }))
  end

  it "renders the edit deliverable form" do
    render

    assert_select "form[action=?][method=?]", mission_deliverable_path(@mission, @deliverable), "post" do
    end
  end
end
