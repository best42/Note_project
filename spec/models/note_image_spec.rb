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

require 'rails_helper'

RSpec.describe NoteImage, :type => :model do
  before(:each) do
  @note = Note.first
  @note_image1 = NoteImage.new(content:"How to calculate mean",
                    note_id: @note.id,
                    image_file_name: "pic",
                    image_content_type: "image/jpg")
  end

  it "user need to add image to pass the test" do
    @note_image1.image_file_name = ""
    @note_image1.image_content_type = ""
    expect(@note_image1.save).to be(false)
  end

  it "if user didnot insert x, it still OK" do
    @note_image1.x = ""
    expect(@note_image1.save).to be(true)
  end
  it "if user didnot insert y, it still OK" do
    @note_image1.y = ""
    expect(@note_image1.save).to be(true)
  end
  it "if user didnot insert content, it still OK" do
    @note_image1.content = ""
    expect(@note_image1.save).to be(true)
  end

  it "if user insert all data then it OK" do
    expect(@note_image1.save).to be(true)
  end

end
