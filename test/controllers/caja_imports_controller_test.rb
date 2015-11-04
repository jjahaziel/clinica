require 'test_helper'

class CajaImportsControllerTest < ActionController::TestCase
  setup do
    @caja_import = caja_imports(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:caja_imports)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create caja_import" do
    assert_difference('CajaImport.count') do
      post :create, caja_import: {  }
    end

    assert_redirected_to caja_import_path(assigns(:caja_import))
  end

  test "should show caja_import" do
    get :show, id: @caja_import
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @caja_import
    assert_response :success
  end

  test "should update caja_import" do
    patch :update, id: @caja_import, caja_import: {  }
    assert_redirected_to caja_import_path(assigns(:caja_import))
  end

  test "should destroy caja_import" do
    assert_difference('CajaImport.count', -1) do
      delete :destroy, id: @caja_import
    end

    assert_redirected_to caja_imports_path
  end
end
