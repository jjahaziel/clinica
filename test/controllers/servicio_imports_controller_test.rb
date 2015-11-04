require 'test_helper'

class ServicioImportsControllerTest < ActionController::TestCase
  setup do
    @servicio_import = servicio_imports(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:servicio_imports)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create servicio_import" do
    assert_difference('ServicioImport.count') do
      post :create, servicio_import: {  }
    end

    assert_redirected_to servicio_import_path(assigns(:servicio_import))
  end

  test "should show servicio_import" do
    get :show, id: @servicio_import
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @servicio_import
    assert_response :success
  end

  test "should update servicio_import" do
    patch :update, id: @servicio_import, servicio_import: {  }
    assert_redirected_to servicio_import_path(assigns(:servicio_import))
  end

  test "should destroy servicio_import" do
    assert_difference('ServicioImport.count', -1) do
      delete :destroy, id: @servicio_import
    end

    assert_redirected_to servicio_imports_path
  end
end
