json.array!(@internalforms) do |internalform|
  json.extract! internalform, :name, :internalform_feild_id
  json.url internalform_url(internalform, format: :json)
end
