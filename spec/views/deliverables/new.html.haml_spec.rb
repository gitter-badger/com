require 'rails_helper'

RSpec.describe "deliverables/new", type: :view do
  before(:each) do
    assign(:deliverable, Deliverable.new())
  end

  it "renders new deliverable form" do
    render

    assert_select "form[action=?][method=?]", deliverables_path, "post" do
    end
  end
end
