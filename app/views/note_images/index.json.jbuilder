json.array!(@note_images) do |note_image|
  json.extract! note_image, :id, :image_id, :x, :y, :content, :note_id
  json.url note_image_url(note_image, format: :json)
end
