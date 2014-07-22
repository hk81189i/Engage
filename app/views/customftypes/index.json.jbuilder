json.array!(@customftypes) do |customftype|
  json.extract! customftype, :name
  json.url customftype_url(customftype, format: :json)
end
