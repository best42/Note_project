json.array!(@notes) do |note|
  json.extract! note, :id, :title, :description, :subject, :teacher, :rating, :owner, :create_note
  json.url note_url(note, format: :json)
end
