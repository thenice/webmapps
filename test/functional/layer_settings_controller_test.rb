require 'test_helper'

class LayerSettingsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:layer_settings)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create layer_setting" do
    assert_difference('LayerSetting.count') do
      post :create, :layer_setting => { }
    end

    assert_redirected_to layer_setting_path(assigns(:layer_setting))
  end

  test "should show layer_setting" do
    get :show, :id => layer_settings(:one).id
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => layer_settings(:one).id
    assert_response :success
  end

  test "should update layer_setting" do
    put :update, :id => layer_settings(:one).id, :layer_setting => { }
    assert_redirected_to layer_setting_path(assigns(:layer_setting))
  end

  test "should destroy layer_setting" do
    assert_difference('LayerSetting.count', -1) do
      delete :destroy, :id => layer_settings(:one).id
    end

    assert_redirected_to layer_settings_path
  end
end
