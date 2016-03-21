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

require 'rails_helper'

RSpec.describe Note, :type => :model do
  before(:each) do
  @user = User.first
  @note1 = Note.new(user_id: @user.id,
                    title: "Normal Distribution",
                    description: "About how to build normal distribution graph and calculate sample mean and standard deviation",
                    subject: "Statistic",
                    teacher: "Ajarn. L")
  end

  it "user need to add title to pass the test" do
    @note1.title = ""
    expect(@note1.save).to be(false)
  end

  it "user need to add subject pass the test" do
    @note1.subject = ""
    expect(@note1.save).to be(false)
  end

  it "user need to add teacher to pass the test" do
    @note1.teacher = ""
    expect(@note1.save).to be(false)
  end

  it "if user didnot insert description, it still OK" do
    @note1.description = ""
    expect(@note1.save).to be(true)
  end

  it "if user insert all data then it OK" do
    expect(@note1.save).to be(true)
  end

end
