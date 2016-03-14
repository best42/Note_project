json.array!(@comments) do |comment|
  json.extract! comment, :id, :content, :note_id, :image_id
  json.url comment_url(comment, format: :json)
end
