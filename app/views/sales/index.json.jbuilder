json.array!(@sales) do |sale|
  json.extract! sale, :contact_id, :sale_id, :batch_id, :bd_id
  json.url sale_url(sale, format: :json)
end
