json.array!(@confirmbookings) do |confirmbooking|
  json.extract! confirmbooking, :name, :email, :phone, :city, :batch, :transformations, :topthreethings, :topthreedreams
  json.url confirmbooking_url(confirmbooking, format: :json)
end
