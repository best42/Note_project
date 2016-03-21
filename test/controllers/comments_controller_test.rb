# == Schema Information
#
# Table name: comments
#
#  id            :integer          not null, primary key
#  content       :text
#  x             :integer
#  y             :integer
#  user_id       :integer
#  note_image_id :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  rating        :integer
#

require 'test_helper'

class CommentsControllerTest < ActionController::TestCase
  setup do
    @comment = comments(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:comments)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create comment" do
    assert_difference('Comment.count') do
      post :create, comment: { content: @comment.content, noteimage_id: @comment.noteimage_id, user_id: @comment.user_id, x: @comment.x, y: @comment.y }
    end

    assert_redirected_to comment_path(assigns(:comment))
  end

  test "should show comment" do
    get :show, id: @comment
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @comment
    assert_response :success
  end

  test "should update comment" do
    patch :update, id: @comment, comment: { content: @comment.content, noteimage_id: @comment.noteimage_id, user_id: @comment.user_id, x: @comment.x, y: @comment.y }
    assert_redirected_to comment_path(assigns(:comment))
  end

  test "should destroy comment" do
    assert_difference('Comment.count', -1) do
      delete :destroy, id: @comment
    end

    assert_redirected_to comments_path
  end
end
