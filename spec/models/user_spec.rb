require 'rails_helper'

RSpec.describe User, type: :model do
  let(:valid_params) { { name: Faker::Name.name } }

  it "can access pg-generated test" do
    user = User.create!(valid_params)
    expect(user.test).to be
  end
end
