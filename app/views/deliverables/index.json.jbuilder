json.array!(@deliverables) do |deliverable|
  json.extract! deliverable, :id
  json.url deliverable_url(deliverable, { format: :json })
end
