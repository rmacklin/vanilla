json.array!(@images) do |image|
  json.extract! image, :id, :url
  json.location image_url(image, format: :json)
end
