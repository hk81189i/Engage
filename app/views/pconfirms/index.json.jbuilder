json.array!(@pconfirms) do |pconfirm|
  json.extract! pconfirm, :name, :email, :phone
  json.url pconfirm_url(pconfirm, format: :json)
end
