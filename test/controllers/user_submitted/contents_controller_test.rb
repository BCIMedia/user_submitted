require 'test_helper'

module UserSubmitted
  class ContentsControllerTest < ActionController::TestCase
    setup do
      @content = user_submitted_contents(:one)
      @routes = Engine.routes
    end

    test "should get index" do
      get :index
      assert_response :success
      assert_not_nil assigns(:contents)
    end

    test "should get new" do
      get :new
      assert_response :success
    end

    test "should create content" do
      assert_difference('Content.count') do
        post :create, content: { name: @content.name, description: @content.description, image: @content.image, file: @content.file }
      end

      assert_redirected_to collection_content_path(assigns(:content))
    end

    test "should show content" do
      get :show, id: @content
      assert_response :success
    end

    test "should get edit" do
      get :edit, id: @content
      assert_response :success
    end

    test "should update content" do
      patch :update, id: @content, content: { name: @content.name, description: @content.description, image: @content.image, file: @content.file }
      assert_redirected_to collection_content_path(assigns(:content))
    end

    test "should destroy content" do
      assert_difference('Content.count', -1) do
        delete :destroy, id: @content
      end

      assert_redirected_to contents_path
    end
  end
end
