json.array!(@collections) do |collection|
  json.extract! collection, :date, :amount, :contact_id, :sale_id
  json.url collection_url(collection, format: :json)
end
