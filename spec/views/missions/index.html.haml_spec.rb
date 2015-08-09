require 'rails_helper'

RSpec.describe "missions/index", type: :view do
  before(:each) do
    assign(:missions, 2.times.collect {
      Mission.create!({ name: Faker::Name.name })
    })
  end

  it "renders a list of missions" do
    render
  end
end
