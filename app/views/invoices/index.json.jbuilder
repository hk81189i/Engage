json.array!(@invoices) do |invoice|
  json.extract! invoice, :name
  json.url invoice_url(invoice, format: :json)
end
