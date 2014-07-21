json.array!(@histories) do |history|
  json.extract! history, :name, :owner, :detail
  json.url history_url(history, format: :json)
end
