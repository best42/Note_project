json.array!(@comments) do |comment|
  json.extract! comment, :id, :content, :x, :y, :user_id, :noteimage_id
  json.url comment_url(comment, format: :json)
end
