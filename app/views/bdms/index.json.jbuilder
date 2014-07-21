json.array!(@bdms) do |bdm|
  json.extract! bdm, :name, :email, :phone
  json.url bdm_url(bdm, format: :json)
end
