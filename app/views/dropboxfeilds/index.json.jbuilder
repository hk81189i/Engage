json.array!(@dropboxfeilds) do |dropboxfeild|
  json.extract! dropboxfeild, :options, :dropbox_id
  json.url dropboxfeild_url(dropboxfeild, format: :json)
end
