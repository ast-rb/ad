require 'test_helper'

class ManageTypesControllerTest < ActionController::TestCase
  setup do
    @manage_type = manage_types(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:manage_types)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create manage_type" do
    assert_difference('ManageType.count') do
      post :create, manage_type: {  }
    end

    assert_redirected_to manage_type_path(assigns(:manage_type))
  end

  test "should show manage_type" do
    get :show, id: @manage_type
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @manage_type
    assert_response :success
  end

  test "should update manage_type" do
    put :update, id: @manage_type, manage_type: {  }
    assert_redirected_to manage_type_path(assigns(:manage_type))
  end

  test "should destroy manage_type" do
    assert_difference('ManageType.count', -1) do
      delete :destroy, id: @manage_type
    end

    assert_redirected_to manage_types_path
  end
end
