require 'test_helper'

class PacienteImportsControllerTest < ActionController::TestCase
  setup do
    @paciente_import = paciente_imports(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:paciente_imports)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create paciente_import" do
    assert_difference('PacienteImport.count') do
      post :create, paciente_import: {  }
    end

    assert_redirected_to paciente_import_path(assigns(:paciente_import))
  end

  test "should show paciente_import" do
    get :show, id: @paciente_import
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @paciente_import
    assert_response :success
  end

  test "should update paciente_import" do
    patch :update, id: @paciente_import, paciente_import: {  }
    assert_redirected_to paciente_import_path(assigns(:paciente_import))
  end

  test "should destroy paciente_import" do
    assert_difference('PacienteImport.count', -1) do
      delete :destroy, id: @paciente_import
    end

    assert_redirected_to paciente_imports_path
  end
end
