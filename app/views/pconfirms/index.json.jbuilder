json.array!(@pconfirms) do |pconfirm|
  json.extract! pconfirm, 
  json.url pconfirm_url(pconfirm, format: :json)
end
