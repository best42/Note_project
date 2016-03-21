# == Schema Information
#
# Table name: comments
#
#  id           :integer          not null, primary key
#  content      :text
#  x            :integer
#  y            :integer
#  user_id      :integer
#  note_image_id :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  rating       :integer
#

require 'rails_helper'

RSpec.describe Comment, :type => :model do
  before(:each) do
  @user = User.first
  @noteimage = NoteImage.first
  @comment1 = Comment.new(content:"This note is good",
                    note_image_id: @noteimage.id,
                    user_id: @user.id)
  end

  it "user need to add content to pass the test" do
    @comment1.content = ""
    expect(@comment1.save).to be(false)
  end

  it "if user didnot insert x it still OK" do
    @comment1.x = ""
    expect(@comment1.save).to be(true)
  end

  it "if user didnot insert y it still OK" do
    @comment1.y = ""
    expect(@comment1.save).to be(true)
  end

  it "if user insert all data then it OK" do
    expect(@comment1.save).to be(true)
  end

end
