require 'test_helper'

class PersonasControllerTest < ActionController::TestCase
  setup do
    @persona = personas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:personas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create persona" do
    assert_difference('Persona.count') do
      post :create, persona: { apellido_casada: @persona.apellido_casada, cedula: @persona.cedula, contacto_emergencia: @persona.contacto_emergencia, direccion: @persona.direccion, fecha_nacimiento: @persona.fecha_nacimiento, primer_apellido: @persona.primer_apellido, primer_nombre: @persona.primer_nombre, segundo_apellido: @persona.segundo_apellido, segundo_nombre: @persona.segundo_nombre, seguro_social: @persona.seguro_social, sexo: @persona.sexo, telefono: @persona.telefono, telefono_emergencia: @persona.telefono_emergencia }
    end

    assert_redirected_to persona_path(assigns(:persona))
  end

  test "should show persona" do
    get :show, id: @persona
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @persona
    assert_response :success
  end

  test "should update persona" do
    patch :update, id: @persona, persona: { apellido_casada: @persona.apellido_casada, cedula: @persona.cedula, contacto_emergencia: @persona.contacto_emergencia, direccion: @persona.direccion, fecha_nacimiento: @persona.fecha_nacimiento, primer_apellido: @persona.primer_apellido, primer_nombre: @persona.primer_nombre, segundo_apellido: @persona.segundo_apellido, segundo_nombre: @persona.segundo_nombre, seguro_social: @persona.seguro_social, sexo: @persona.sexo, telefono: @persona.telefono, telefono_emergencia: @persona.telefono_emergencia }
    assert_redirected_to persona_path(assigns(:persona))
  end

  test "should destroy persona" do
    assert_difference('Persona.count', -1) do
      delete :destroy, id: @persona
    end

    assert_redirected_to personas_path
  end
end
