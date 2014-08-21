require 'test_helper'

module Mjweb
  class TrainingsControllerTest < ActionController::TestCase
    setup do
      @training = trainings(:one)
    end

    test "should get index" do
      get :index
      assert_response :success
      assert_not_nil assigns(:trainings)
    end

    test "should get new" do
      get :new
      assert_response :success
    end

    test "should create training" do
      assert_difference('Training.count') do
        post :create, training: { company_id: @training.company_id, image_id: @training.image_id, link_text: @training.link_text, link_url: @training.link_url, text: @training.text, title: @training.title }
      end

      assert_redirected_to training_path(assigns(:training))
    end

    test "should show training" do
      get :show, id: @training
      assert_response :success
    end

    test "should get edit" do
      get :edit, id: @training
      assert_response :success
    end

    test "should update training" do
      patch :update, id: @training, training: { company_id: @training.company_id, image_id: @training.image_id, link_text: @training.link_text, link_url: @training.link_url, text: @training.text, title: @training.title }
      assert_redirected_to training_path(assigns(:training))
    end

    test "should destroy training" do
      assert_difference('Training.count', -1) do
        delete :destroy, id: @training
      end

      assert_redirected_to trainings_path
    end
  end
end
