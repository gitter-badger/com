require 'rails_helper'

RSpec.describe Deliverable, type: :model do
  it 'defaults ordering to 0' do
    deliverable = Deliverable.create!
    expect(deliverable.ordering).to eq(0)
  end
end
