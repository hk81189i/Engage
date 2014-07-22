json.array!(@contacts) do |contact|
  json.extract! contact, :name, :age, :email, :phone, :photo
  json.url contact_url(contact, format: :json)
end
