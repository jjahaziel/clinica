require 'test_helper'

class RecibosControllerTest < ActionController::TestCase
  setup do
    @recibo = recibos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:recibos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create recibo" do
    assert_difference('Recibo.count') do
      post :create, recibo: { caja_id: @recibo.caja_id, doctor_id: @recibo.doctor_id, numero_recibo: @recibo.numero_recibo, paciente: @recibo.paciente, paciente_id: @recibo.paciente_id, total: @recibo.total, total_porcentaje_doctor: @recibo.total_porcentaje_doctor, total_porcentaje_laboratorio: @recibo.total_porcentaje_laboratorio, total_porcenteje_clinica: @recibo.total_porcenteje_clinica }
    end

    assert_redirected_to recibo_path(assigns(:recibo))
  end

  test "should show recibo" do
    get :show, id: @recibo
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @recibo
    assert_response :success
  end

  test "should update recibo" do
    patch :update, id: @recibo, recibo: { caja_id: @recibo.caja_id, doctor_id: @recibo.doctor_id, numero_recibo: @recibo.numero_recibo, paciente: @recibo.paciente, paciente_id: @recibo.paciente_id, total: @recibo.total, total_porcentaje_doctor: @recibo.total_porcentaje_doctor, total_porcentaje_laboratorio: @recibo.total_porcentaje_laboratorio, total_porcenteje_clinica: @recibo.total_porcenteje_clinica }
    assert_redirected_to recibo_path(assigns(:recibo))
  end

  test "should destroy recibo" do
    assert_difference('Recibo.count', -1) do
      delete :destroy, id: @recibo
    end

    assert_redirected_to recibos_path
  end
end
