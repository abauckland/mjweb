require 'test_helper'

module Mjweb
  class ImagesettingsControllerTest < ActionController::TestCase
    test "should get index" do
      get :index
      assert_response :success
    end

    test "should get new" do
      get :new
      assert_response :success
    end

  end
end
