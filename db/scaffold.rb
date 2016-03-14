rails g scaffold Note title:string description:text subject:string teacher:text rating:integer owner:text create_note:date
rails g scaffold Image image_id:integer:index x:integer y:integer content:text note:references
rails g scaffold Comment content:text note:references image:references

rails g paperclip Note image
rails g paperclip Image image

# ------ To Delete ----------
# rails d scaffold Note
# rails d scaffold Image

# rails generate devise User
