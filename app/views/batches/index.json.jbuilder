json.array!(@batches) do |batch|
  json.extract! batch, :date, :name, :product_id
  json.url batch_url(batch, format: :json)
end
