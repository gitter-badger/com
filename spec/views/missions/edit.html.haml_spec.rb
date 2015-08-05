require 'rails_helper'

RSpec.describe "missions/edit", type: :view do
  before(:each) do
    @mission = assign(:mission, Mission.create!({
      name: Faker::Name.name
    }))
  end

  it "renders the edit mission form" do
    render

    assert_select "form[action=?][method=?]", mission_path(@mission), "post" do
    end
  end
end
