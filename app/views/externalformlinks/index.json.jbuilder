json.array!(@externalformlinks) do |externalformlink|
  json.extract! externalformlink, :contact_id, :link, :form_id
  json.url externalformlink_url(externalformlink, format: :json)
end
