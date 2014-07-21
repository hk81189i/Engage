json.array!(@users) do |user|
  json.extract! user, :name, :email, :phone, :bdm_id, :saledate, :selling_price, :token
  json.url user_url(user, format: :json)
end
