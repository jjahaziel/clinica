require 'test_helper'

class DoctoresControllerTest < ActionController::TestCase
  setup do
    @doctor = doctores(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:doctores)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create doctor" do
    assert_difference('Doctor.count') do
      post :create, doctor: { especialidades: @doctor.especialidades, numero_doctor: @doctor.numero_doctor, persona_id: @doctor.persona_id }
    end

    assert_redirected_to doctor_path(assigns(:doctor))
  end

  test "should show doctor" do
    get :show, id: @doctor
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @doctor
    assert_response :success
  end

  test "should update doctor" do
    patch :update, id: @doctor, doctor: { especialidades: @doctor.especialidades, numero_doctor: @doctor.numero_doctor, persona_id: @doctor.persona_id }
    assert_redirected_to doctor_path(assigns(:doctor))
  end

  test "should destroy doctor" do
    assert_difference('Doctor.count', -1) do
      delete :destroy, id: @doctor
    end

    assert_redirected_to doctores_path
  end
end
