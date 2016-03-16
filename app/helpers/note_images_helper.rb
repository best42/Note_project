# == Schema Information
#
# Table name: note_images
#
#  id                 :integer          not null, primary key
#  image_id           :integer
#  x                  :integer
#  y                  :integer
#  content            :text
#  note_id            :integer
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  image_file_name    :string
#  image_content_type :string
#  image_file_size    :integer
#  image_updated_at   :datetime
#

module NoteImagesHelper
end
