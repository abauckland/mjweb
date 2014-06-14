require 'test_helper'

module Mjweb
  class WebsiteControllerTest < ActionController::TestCase
    test "should get show" do
      get :show
      assert_response :success
    end

  end
end
