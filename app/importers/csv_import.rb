require "csv"

module CSVImport
  class << self
    def import!(filepath)
      data = {}

      CSV.foreach(filepath) do |row|
        mission, deliverable, requirement = row[0..2]

        data[mission] ||= { deliverables: {} }
        data[mission][:deliverables][deliverable] ||= []
        data[mission][:deliverables][deliverable] << requirement
      end

      process_data!(data)
    end

    private

    def process_data!(data)
      data.each do |mission, info|
        m = Mission.create!({ name: mission })
        info[:deliverables].each.with_index do |(deliverable, reqs), i|
          d = m.deliverables.create!({ name: deliverable, ordering: i })
          reqs.each.with_index do |req, j|
            d.requirements.create!({ name: req, ordering: j })
          end
        end
      end
    end
  end
end
