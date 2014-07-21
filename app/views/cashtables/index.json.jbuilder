json.array!(@cashtables) do |cashtable|
  json.extract! cashtable, :year, :jan, :feb, :mar, :apr, :may, :jun, :july, :aug, :sept, :oct, :nov, :dec, :lead_id, :bdm_id
  json.url cashtable_url(cashtable, format: :json)
end
