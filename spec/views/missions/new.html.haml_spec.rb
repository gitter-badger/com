require 'rails_helper'

RSpec.describe "missions/new", type: :view do
  before(:each) do
    assign(:mission, Mission.new())
  end

  it "renders new mission form" do
    render

    assert_select("form[action=?][method=?]", missions_path, "post") do
    end
  end
end
