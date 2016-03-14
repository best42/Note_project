json.array!(@images) do |image|
  json.extract! image, :id, :image_id, :x, :y, :content, :note_id
  json.url image_url(image, format: :json)
end
