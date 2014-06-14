require 'test_helper'

module Mjweb
  class DetailsControllerTest < ActionController::TestCase
    setup do
      @detail = details(:one)
    end

    test "should get index" do
      get :index
      assert_response :success
      assert_not_nil assigns(:details)
    end

    test "should get new" do
      get :new
      assert_response :success
    end

    test "should create detail" do
      assert_difference('Detail.count') do
        post :create, detail: { company_id: @detail.company_id, ecommerce: @detail.ecommerce, facebook: @detail.facebook, googleplus: @detail.googleplus, linkedin: @detail.linkedin, tagline: @detail.tagline, twitter: @detail.twitter }
      end

      assert_redirected_to detail_path(assigns(:detail))
    end

    test "should show detail" do
      get :show, id: @detail
      assert_response :success
    end

    test "should get edit" do
      get :edit, id: @detail
      assert_response :success
    end

    test "should update detail" do
      patch :update, id: @detail, detail: { company_id: @detail.company_id, ecommerce: @detail.ecommerce, facebook: @detail.facebook, googleplus: @detail.googleplus, linkedin: @detail.linkedin, tagline: @detail.tagline, twitter: @detail.twitter }
      assert_redirected_to detail_path(assigns(:detail))
    end

    test "should destroy detail" do
      assert_difference('Detail.count', -1) do
        delete :destroy, id: @detail
      end

      assert_redirected_to details_path
    end
  end
end
