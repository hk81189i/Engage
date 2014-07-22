json.array!(@internalformfeilds) do |internalformfeild|
  json.extract! internalformfeild, :internalform_id, :customftypes_id, :customf_id, :required
  json.url internalformfeild_url(internalformfeild, format: :json)
end
