# == Schema Information
#
# Table name: notes
#
#  id                 :integer          not null, primary key
#  title              :string
#  description        :text
#  subject            :string
#  teacher            :text
#  rating             :integer
#  user_id            :integer
#  create_note        :date
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  image_file_name    :string
#  image_content_type :string
#  image_file_size    :integer
#  image_updated_at   :datetime
#

class Note < ActiveRecord::Base
  belongs_to :user
  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
  has_many :note_images
  accepts_nested_attributes_for :images
  searchkick

  validates :title, presence: true
  validates :subject, presence: true
  validates :teacher, presence: true
end
