require 'test_helper'

class AtencionesControllerTest < ActionController::TestCase
  setup do
    @atencion = atenciones(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:atenciones)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create atencion" do
    assert_difference('Atencion.count') do
      post :create, atencion: { cantidad: @atencion.cantidad, descuento: @atencion.descuento, recibo_id: @atencion.recibo_id, servicio_id: @atencion.servicio_id }
    end

    assert_redirected_to atencion_path(assigns(:atencion))
  end

  test "should show atencion" do
    get :show, id: @atencion
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @atencion
    assert_response :success
  end

  test "should update atencion" do
    patch :update, id: @atencion, atencion: { cantidad: @atencion.cantidad, descuento: @atencion.descuento, recibo_id: @atencion.recibo_id, servicio_id: @atencion.servicio_id }
    assert_redirected_to atencion_path(assigns(:atencion))
  end

  test "should destroy atencion" do
    assert_difference('Atencion.count', -1) do
      delete :destroy, id: @atencion
    end

    assert_redirected_to atenciones_path
  end
end
