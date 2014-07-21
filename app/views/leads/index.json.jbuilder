json.array!(@leads) do |lead|
  json.extract! lead, 
  json.url lead_url(lead, format: :json)
end
