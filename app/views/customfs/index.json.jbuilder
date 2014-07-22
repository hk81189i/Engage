json.array!(@customfs) do |customf|
  json.extract! customf, :name
  json.url customf_url(customf, format: :json)
end
