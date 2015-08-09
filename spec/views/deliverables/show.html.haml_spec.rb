require 'rails_helper'

RSpec.describe "deliverables/show", type: :view do
  before(:each) do
    @deliverable = assign(:deliverable, Deliverable.create!(
     name: rand.to_s[0..12]))
  end

  it "renders attributes in <p>" do
    render
  end
end
