json.array!(@lead_statuses) do |lead_status|
  json.extract! lead_status, :name
  json.url lead_status_url(lead_status, format: :json)
end
