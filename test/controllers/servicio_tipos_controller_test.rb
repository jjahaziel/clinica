require 'test_helper'

class ServicioTiposControllerTest < ActionController::TestCase
  setup do
    @servicio_tipo = servicio_tipos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:servicio_tipos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create servicio_tipo" do
    assert_difference('ServicioTipo.count') do
      post :create, servicio_tipo: { descripcion: @servicio_tipo.descripcion, tipo: @servicio_tipo.tipo }
    end

    assert_redirected_to servicio_tipo_path(assigns(:servicio_tipo))
  end

  test "should show servicio_tipo" do
    get :show, id: @servicio_tipo
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @servicio_tipo
    assert_response :success
  end

  test "should update servicio_tipo" do
    patch :update, id: @servicio_tipo, servicio_tipo: { descripcion: @servicio_tipo.descripcion, tipo: @servicio_tipo.tipo }
    assert_redirected_to servicio_tipo_path(assigns(:servicio_tipo))
  end

  test "should destroy servicio_tipo" do
    assert_difference('ServicioTipo.count', -1) do
      delete :destroy, id: @servicio_tipo
    end

    assert_redirected_to servicio_tipos_path
  end
end
