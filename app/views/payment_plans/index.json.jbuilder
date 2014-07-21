json.array!(@payment_plans) do |payment_plan|
  json.extract! payment_plan, :year, :jan, :feb, :mar, :apr, :may, :jun, :july, :aug, :sept, :oct, :nov, :dec, :lead_id, :bdm_id
  json.url payment_plan_url(payment_plan, format: :json)
end
