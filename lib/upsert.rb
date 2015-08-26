module Upsert
  def upsert!(data)
    upsert_initialize(data).save!
  end

  def upsert(data)
    upsert_initialize(data).save
  end

  private

  def upsert_initialize(data)
    record = find_or_initialize_by({
      primary_key => data.fetch(primary_key)
    })
    record.attributes = data
    record
  end
end
