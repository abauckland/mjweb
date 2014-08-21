require 'test_helper'

module Mjweb
  class BanksControllerTest < ActionController::TestCase
    setup do
      @bank = banks(:one)
    end

    test "should get index" do
      get :index
      assert_response :success
      assert_not_nil assigns(:banks)
    end

    test "should get new" do
      get :new
      assert_response :success
    end

    test "should create bank" do
      assert_difference('Bank.count') do
        post :create, bank: { company_id: @bank.company_id, image_id: @bank.image_id, link_text: @bank.link_text, link_url: @bank.link_url, text: @bank.text, title: @bank.title }
      end

      assert_redirected_to bank_path(assigns(:bank))
    end

    test "should show bank" do
      get :show, id: @bank
      assert_response :success
    end

    test "should get edit" do
      get :edit, id: @bank
      assert_response :success
    end

    test "should update bank" do
      patch :update, id: @bank, bank: { company_id: @bank.company_id, image_id: @bank.image_id, link_text: @bank.link_text, link_url: @bank.link_url, text: @bank.text, title: @bank.title }
      assert_redirected_to bank_path(assigns(:bank))
    end

    test "should destroy bank" do
      assert_difference('Bank.count', -1) do
        delete :destroy, id: @bank
      end

      assert_redirected_to banks_path
    end
  end
end
