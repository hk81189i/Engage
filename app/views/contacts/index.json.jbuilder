json.array!(@contacts) do |contact|
  json.extract! contact, :name, :email, :phone, :admin_id, :fname, :lname, :infu_id, :bd_id
  json.url contact_url(contact, format: :json)
end
