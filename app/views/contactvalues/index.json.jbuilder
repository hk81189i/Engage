json.array!(@contactvalues) do |contactvalue|
  json.extract! contactvalue, :contact_id, :customftype, :customf, :data
  json.url contactvalue_url(contactvalue, format: :json)
end
