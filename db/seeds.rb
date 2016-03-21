# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

user1 = User.create(username:"lo",
                  email: "best@gmail.com",
                  password: "34567890",
                  password_confirmation: "34567890")

note1 = Note.create(title:"Global Warming",
                  description:"About how global warming happen",
                  subject: "Ecosystem and natural resource",
                  teacher: "Ajarn. Laine",
                  image_file_name: "w2.jpg",
                  image_content_type: "image/jpg",
                  user_id: user1.id)

note_image1 = NoteImage.create(content:"Global warming diagram",
                  note_id: user1.id,
                  image_file_name: "w2.jpg",
                  image_content_type: "image/jpg")

comment1 = Comment.create(content:"This note is clear",
                  note_image_id: note_image1.id,
                  user_id: user1.id)
