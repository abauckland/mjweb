require 'test_helper'

module Mjweb
  class NetworkingsControllerTest < ActionController::TestCase
    setup do
      @networking = networkings(:one)
    end

    test "should get index" do
      get :index
      assert_response :success
      assert_not_nil assigns(:networkings)
    end

    test "should get new" do
      get :new
      assert_response :success
    end

    test "should create networking" do
      assert_difference('Networking.count') do
        post :create, networking: { company_id: @networking.company_id, image_id: @networking.image_id, link_text: @networking.link_text, link_url: @networking.link_url, text: @networking.text, title: @networking.title }
      end

      assert_redirected_to networking_path(assigns(:networking))
    end

    test "should show networking" do
      get :show, id: @networking
      assert_response :success
    end

    test "should get edit" do
      get :edit, id: @networking
      assert_response :success
    end

    test "should update networking" do
      patch :update, id: @networking, networking: { company_id: @networking.company_id, image_id: @networking.image_id, link_text: @networking.link_text, link_url: @networking.link_url, text: @networking.text, title: @networking.title }
      assert_redirected_to networking_path(assigns(:networking))
    end

    test "should destroy networking" do
      assert_difference('Networking.count', -1) do
        delete :destroy, id: @networking
      end

      assert_redirected_to networkings_path
    end
  end
end
