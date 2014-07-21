json.array!(@owners) do |owner|
  json.extract! owner, :name, :email, :phone
  json.url owner_url(owner, format: :json)
end
