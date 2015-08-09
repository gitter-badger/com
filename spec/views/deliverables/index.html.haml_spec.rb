require 'rails_helper'

RSpec.describe "deliverables/index", type: :view do
  before(:each) do
    assign(:deliverables, [
      Deliverable.create!(name: "deliverable1"),
      Deliverable.create!(name: "deliverable2")
    ])
  end

  it "renders a list of deliverables" do
    render
  end
end
