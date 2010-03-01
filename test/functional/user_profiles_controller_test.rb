require 'test_helper'

class UserProfilesControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end
  
  def test_show
    get :show, :id => UserProfile.first
    assert_template 'show'
  end
  
  def test_new
    get :new
    assert_template 'new'
  end
  
  def test_create_invalid
    UserProfile.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end
  
  def test_create_valid
    UserProfile.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to user_profile_url(assigns(:user_profile))
  end
  
  def test_edit
    get :edit, :id => UserProfile.first
    assert_template 'edit'
  end
  
  def test_update_invalid
    UserProfile.any_instance.stubs(:valid?).returns(false)
    put :update, :id => UserProfile.first
    assert_template 'edit'
  end
  
  def test_update_valid
    UserProfile.any_instance.stubs(:valid?).returns(true)
    put :update, :id => UserProfile.first
    assert_redirected_to user_profile_url(assigns(:user_profile))
  end
  
  def test_destroy
    user_profile = UserProfile.first
    delete :destroy, :id => user_profile
    assert_redirected_to user_profiles_url
    assert !UserProfile.exists?(user_profile.id)
  end
end
