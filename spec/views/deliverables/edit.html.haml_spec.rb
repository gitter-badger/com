require 'rails_helper'

RSpec.describe "deliverables/edit", type: :view do
  before(:each) do
    @deliverable = assign(:deliverable, Deliverable.create!(
      name: rand.to_s[1..12]))
  end

  it "renders the edit deliverable form" do
    render

    assert_select "form[action=?][method=?]", deliverable_path(@deliverable), "post" do
    end
  end
end
