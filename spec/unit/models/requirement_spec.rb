require 'rails_helper'

RSpec.describe Requirement, type: :model do
  it 'defaults ordering to 0' do
    requirement = Requirement.create!
    expect(requirement.ordering).to eq(0)
  end
end
