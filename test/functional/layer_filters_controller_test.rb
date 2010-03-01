require 'test_helper'

class LayerFiltersControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:layer_filters)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create layer_filter" do
    assert_difference('LayerFilter.count') do
      post :create, :layer_filter => { }
    end

    assert_redirected_to layer_filter_path(assigns(:layer_filter))
  end

  test "should show layer_filter" do
    get :show, :id => layer_filters(:one).id
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => layer_filters(:one).id
    assert_response :success
  end

  test "should update layer_filter" do
    put :update, :id => layer_filters(:one).id, :layer_filter => { }
    assert_redirected_to layer_filter_path(assigns(:layer_filter))
  end

  test "should destroy layer_filter" do
    assert_difference('LayerFilter.count', -1) do
      delete :destroy, :id => layer_filters(:one).id
    end

    assert_redirected_to layer_filters_path
  end
end
