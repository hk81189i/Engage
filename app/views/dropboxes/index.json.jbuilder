json.array!(@dropboxes) do |dropbox|
  json.extract! dropbox, :customftype_id
  json.url dropbox_url(dropbox, format: :json)
end
