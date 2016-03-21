# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string
#  last_sign_in_ip        :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  username               :string
#

require 'rails_helper'

RSpec.describe User, type: :model do
  before(:each) do
    @user1 = User.new(username:"phu1",
                      email: "phu@gmail.com",
                      password: "1234567890",
                      password_confirmation: "1234567890")
    @user2 = User.new(username:"tow1",
                      email: "tow@gmail.com",
                      password: "qwertyuiop",
                      password_confirmation: "qwertyuiop")
  end

  it "user need to add username to pass test" do
    @user1.username = ""
    expect(@user1.save).to be(false)
  end

  it "username need to be unique to pass test" do
    @user1.username = "best1"
    @user1.save
    @user2.username = "Best1"
    expect(@user2.save).to be(false)
  end

  it "email need to be add to pass test" do
    @user1.email = ""
    expect(@user1.save).to be(false)
  end

  it "email need to be unique to pass test" do
    @user1.email = "best1@gmail.com"
    @user1.save
    @user2.email = "BEST1@gmail.com"
    expect(@user2.save).to be(false)
  end

  it "user need to add password, password_confirmation inorder to pass test" do
    @user1.password = ""
    @user1.password_confirmation = ""
    expect(@user1.save).to be(false)
  end

  it "password and password_confirmation need to be the same inorder to pass test" do
    @user1.password = "1234567890"
    @user1.password_confirmation = "123456789"
    expect(@user1.save).to be(false)
  end

  it "password and password_confirmation need to be 8 character long to pass test" do
    @user1.password = "123456"
    @user1.password_confirmation = "123456"
    expect(@user1.save).to be(false)
  end

  it " if have password and password_confirmation of 8 character long then pass test" do
    @user1.password = "12345678"
    @user1.password_confirmation = "12345678"
    expect(@user1.save).to be(true)
  end

  it "if the user insert all information then it ok" do
    expect(@user1.save).to be(true)
  end

end
