require 'test_helper'

class ManageAdsControllerTest < ActionController::TestCase
  setup do
    @manage_ad = manage_ads(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:manage_ads)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create manage_ad" do
    assert_difference('ManageAd.count') do
      post :create, manage_ad: {  }
    end

    assert_redirected_to manage_ad_path(assigns(:manage_ad))
  end

  test "should show manage_ad" do
    get :show, id: @manage_ad
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @manage_ad
    assert_response :success
  end

  test "should update manage_ad" do
    put :update, id: @manage_ad, manage_ad: {  }
    assert_redirected_to manage_ad_path(assigns(:manage_ad))
  end

  test "should destroy manage_ad" do
    assert_difference('ManageAd.count', -1) do
      delete :destroy, id: @manage_ad
    end

    assert_redirected_to manage_ads_path
  end
end
