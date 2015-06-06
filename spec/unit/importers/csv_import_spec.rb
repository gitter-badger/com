require 'rails_helper'

RSpec.describe CSVImport do
  let(:tmp_path) { "spec/tmp/test_import.csv" }

  def create_import_file(rows)
    CSV.open(tmp_path, 'w') do |csv|
      rows.each do |row|
        csv << row
      end
    end
  end

  it 'loads a mission, deliverable, and requirement' do
    create_import_file([
      ['Mission 1', 'Deliverable 1', 'Requirement 1'],
      ['Mission 1', 'Deliverable 1', 'Requirement 2'],
      ['Mission 1', 'Deliverable 1', 'Requirement 3'],
      ['Mission 1', 'Deliverable 2', 'Requirement 4'],
      ['Mission 2', 'Deliverable 3', 'Requirement 5'],
    ])

    expect {
      expect {
        expect {
          CSVImport.import!(tmp_path)
        }.to change(Mission, :count).by(2)
      }.to change(Deliverable, :count).by(3)
    }.to change(Requirement, :count).by(5)

    expect(Deliverable.find_by(name: 'Deliverable 2').ordering).to eq(1)
    expect(Deliverable.find_by(name: 'Deliverable 3').ordering).to eq(0)
    expect(Requirement.find_by(name: 'Requirement 3').ordering).to eq(2)
  end
end
