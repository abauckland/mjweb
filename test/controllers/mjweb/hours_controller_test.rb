require 'test_helper'

module Mjweb
  class HoursControllerTest < ActionController::TestCase
    setup do
      @hour = hours(:one)
    end

    test "should get index" do
      get :index
      assert_response :success
      assert_not_nil assigns(:hours)
    end

    test "should get new" do
      get :new
      assert_response :success
    end

    test "should create hour" do
      assert_difference('Hour.count') do
        post :create, hour: { company_id: @hour.company_id, friday_close: @hour.friday_close, friday_open: @hour.friday_open, friday_status: @hour.friday_status, monday_close: @hour.monday_close, monday_open: @hour.monday_open, monday_status: @hour.monday_status, saturday_close: @hour.saturday_close, saturday_open: @hour.saturday_open, saturday_status: @hour.saturday_status, sunday_close: @hour.sunday_close, sunday_open: @hour.sunday_open, sunday_status: @hour.sunday_status, thursday_close: @hour.thursday_close, thursday_open: @hour.thursday_open, thursday_status: @hour.thursday_status, tuesday_close: @hour.tuesday_close, tuesday_open: @hour.tuesday_open, tuesday_status: @hour.tuesday_status, wednesday_close: @hour.wednesday_close, wednesday_open: @hour.wednesday_open, wednesday_status: @hour.wednesday_status }
      end

      assert_redirected_to hour_path(assigns(:hour))
    end

    test "should show hour" do
      get :show, id: @hour
      assert_response :success
    end

    test "should get edit" do
      get :edit, id: @hour
      assert_response :success
    end

    test "should update hour" do
      patch :update, id: @hour, hour: { company_id: @hour.company_id, friday_close: @hour.friday_close, friday_open: @hour.friday_open, friday_status: @hour.friday_status, monday_close: @hour.monday_close, monday_open: @hour.monday_open, monday_status: @hour.monday_status, saturday_close: @hour.saturday_close, saturday_open: @hour.saturday_open, saturday_status: @hour.saturday_status, sunday_close: @hour.sunday_close, sunday_open: @hour.sunday_open, sunday_status: @hour.sunday_status, thursday_close: @hour.thursday_close, thursday_open: @hour.thursday_open, thursday_status: @hour.thursday_status, tuesday_close: @hour.tuesday_close, tuesday_open: @hour.tuesday_open, tuesday_status: @hour.tuesday_status, wednesday_close: @hour.wednesday_close, wednesday_open: @hour.wednesday_open, wednesday_status: @hour.wednesday_status }
      assert_redirected_to hour_path(assigns(:hour))
    end

    test "should destroy hour" do
      assert_difference('Hour.count', -1) do
        delete :destroy, id: @hour
      end

      assert_redirected_to hours_path
    end
  end
end
