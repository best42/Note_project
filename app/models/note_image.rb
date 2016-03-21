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

class NoteImage < ActiveRecord::Base
  belongs_to :note
  has_attached_file :image, styles: { large: "600x600", medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
  has_many :comments

  validates_attachment :image, presence: true,
    content_type: { content_type: ["image/jpg", "image/jpeg", "image/gif", "image/png"] }
end
