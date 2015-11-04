require 'test_helper'

class DoctorImportsControllerTest < ActionController::TestCase
  setup do
    @doctor_import = doctor_imports(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:doctor_imports)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create doctor_import" do
    assert_difference('DoctorImport.count') do
      post :create, doctor_import: {  }
    end

    assert_redirected_to doctor_import_path(assigns(:doctor_import))
  end

  test "should show doctor_import" do
    get :show, id: @doctor_import
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @doctor_import
    assert_response :success
  end

  test "should update doctor_import" do
    patch :update, id: @doctor_import, doctor_import: {  }
    assert_redirected_to doctor_import_path(assigns(:doctor_import))
  end

  test "should destroy doctor_import" do
    assert_difference('DoctorImport.count', -1) do
      delete :destroy, id: @doctor_import
    end

    assert_redirected_to doctor_imports_path
  end
end
