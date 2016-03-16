rails g scaffold Note title:string description:text subject:string teacher:text rating:integer user:references create_note:date
rails g scaffold NoteImage image_id:integer:index x:integer y:integer content:text note:references
rails g scaffold Comment content:text x:integer y:integer user:references noteimage:references

rails g migration AddTypeToUser username:string

rails g paperclip Note image
rails g paperclip NoteImage image

# ------ To Delete ----------
# rails d scaffold Note
# rails d scaffold NoteImage
# rails d scaffold Comment

# rails generate devise:views
