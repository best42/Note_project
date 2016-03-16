json.array!(@notes) do |note|
  json.extract! note, :id, :title, :description, :subject, :teacher, :rating, :user_id, :create_note
  json.url note_url(note, format: :json)
end
