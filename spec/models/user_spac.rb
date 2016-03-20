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
    @user1 = User.new(username:"Best",
                      email: "best@gmail.com",
                      password: "1234567890",
                      password_confirmation: "1234567890")
  end

  it "user need to add username, email, password, password_confirmation inorder to pass test" do
    @user1.username = ""
    @user1.email = ""
    @user1.password = ""
    @user1.password_confirmation = ""
    expect(@user1.save).to be(false)
  end

  it "user need to add email, password, password_confirmation inorder to pass test" do
    @user1.email = ""
    @user1.password = ""
    @user1.password_confirmation = ""
    expect(@user1.save).to be(false)
  end

  it "user need to add password, password_confirmation inorder to pass test" do
    @user1.password = ""
    @user1.password_confirmation = ""
    expect(@user1.save).to be(false)
  end

  it "user need to add password_confirmation inorder to pass test" do
    @user1.password_confirmation = ""
    expect(@user1.save).to be(false)
  end

  it "if the user insert all information then it ok" do
    expect(@user1.save).to be(true)
  end

end
