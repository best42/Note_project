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

require 'test_helper'

class NoteImagesControllerTest < ActionController::TestCase
  setup do
    @note_image = note_images(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:note_images)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create note_image" do
    assert_difference('NoteImage.count') do
      post :create, note_image: { content: @note_image.content, image_id: @note_image.image_id, note_id: @note_image.note_id, x: @note_image.x, y: @note_image.y }
    end

    assert_redirected_to note_image_path(assigns(:note_image))
  end

  test "should show note_image" do
    get :show, id: @note_image
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @note_image
    assert_response :success
  end

  test "should update note_image" do
    patch :update, id: @note_image, note_image: { content: @note_image.content, image_id: @note_image.image_id, note_id: @note_image.note_id, x: @note_image.x, y: @note_image.y }
    assert_redirected_to note_image_path(assigns(:note_image))
  end

  test "should destroy note_image" do
    assert_difference('NoteImage.count', -1) do
      delete :destroy, id: @note_image
    end

    assert_redirected_to note_images_path
  end
end
