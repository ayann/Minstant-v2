require 'test_helper'

class OpenfireUsersControllerTest < ActionController::TestCase
  setup do
    @openfire_user = openfire_users(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:openfire_users)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create openfire_user" do
    assert_difference('OpenfireUser.count') do
      post :create, openfire_user: { groups: @openfire_user.groups, mi_user_id: @openfire_user.mi_user_id, name: @openfire_user.name, username: @openfire_user.username }
    end

    assert_redirected_to openfire_user_path(assigns(:openfire_user))
  end

  test "should show openfire_user" do
    get :show, id: @openfire_user
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @openfire_user
    assert_response :success
  end

  test "should update openfire_user" do
    patch :update, id: @openfire_user, openfire_user: { groups: @openfire_user.groups, mi_user_id: @openfire_user.mi_user_id, name: @openfire_user.name, username: @openfire_user.username }
    assert_redirected_to openfire_user_path(assigns(:openfire_user))
  end

  test "should destroy openfire_user" do
    assert_difference('OpenfireUser.count', -1) do
      delete :destroy, id: @openfire_user
    end

    assert_redirected_to openfire_users_path
  end
end
