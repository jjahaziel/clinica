require 'test_helper'

class ServicioTipoImportsControllerTest < ActionController::TestCase
  setup do
    @servicio_tipo_import = servicio_tipo_imports(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:servicio_tipo_imports)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create servicio_tipo_import" do
    assert_difference('ServicioTipoImport.count') do
      post :create, servicio_tipo_import: {  }
    end

    assert_redirected_to servicio_tipo_import_path(assigns(:servicio_tipo_import))
  end

  test "should show servicio_tipo_import" do
    get :show, id: @servicio_tipo_import
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @servicio_tipo_import
    assert_response :success
  end

  test "should update servicio_tipo_import" do
    patch :update, id: @servicio_tipo_import, servicio_tipo_import: {  }
    assert_redirected_to servicio_tipo_import_path(assigns(:servicio_tipo_import))
  end

  test "should destroy servicio_tipo_import" do
    assert_difference('ServicioTipoImport.count', -1) do
      delete :destroy, id: @servicio_tipo_import
    end

    assert_redirected_to servicio_tipo_imports_path
  end
end
