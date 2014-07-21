json.array!(@pplans) do |pplan|
  json.extract! pplan, :paying_date, :amount, :contact_id, :sale_id
  json.url pplan_url(pplan, format: :json)
end
