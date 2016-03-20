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
  @note1 = Note.new(title:"Normal Distribution",
                    description:"About how to build normal distribution graph and calculate sample mean and standard deviation",
                    subject: "Statistic",
                    teacher: "Ajarn. L",
                    user_id: 1,
                    image_file_name: "pic.jpg",
                    image_content_type: "image/jpg")
  end

  it "user need to add title,subject,teacher,image to pass the test" do
    @note1.title = ""
    @note1.subject = ""
    @note1.teacher = ""
    @note1.image_file_name = ""
    @note1.image_content_type = ""
    expect(@note1.save).to be(false)
  end

  it "user need to add subject,teacher,image to pass the test" do
    @note1.title = "Normal Distribution"
    @note1.subject = ""
    @note1.teacher = ""
    @note1.image_file_name = ""
    @note1.image_content_type = ""
    expect(@note1.save).to be(false)
  end

  it "user need to add teacher,image to pass the test" do
    @note1.title = "Normal Distribution"
    @note1.subject = "Statistic"
    @note1.teacher = ""
    @note1.image_file_name = ""
    @note1.image_content_type = ""
    expect(@note1.save).to be(false)
  end

  it "user need to add image to pass the test" do
    @note1.title = "Normal Distribution"
    @note1.subject = "Statistic"
    @note1.teacher = "Ajarn. L"
    @note1.image_file_name = ""
    @note1.image_content_type = ""
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
