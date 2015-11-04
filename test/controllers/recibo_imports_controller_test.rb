require 'test_helper'

class ReciboImportsControllerTest < ActionController::TestCase
  setup do
    @recibo_import = recibo_imports(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:recibo_imports)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create recibo_import" do
    assert_difference('ReciboImport.count') do
      post :create, recibo_import: {  }
    end

    assert_redirected_to recibo_import_path(assigns(:recibo_import))
  end

  test "should show recibo_import" do
    get :show, id: @recibo_import
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @recibo_import
    assert_response :success
  end

  test "should update recibo_import" do
    patch :update, id: @recibo_import, recibo_import: {  }
    assert_redirected_to recibo_import_path(assigns(:recibo_import))
  end

  test "should destroy recibo_import" do
    assert_difference('ReciboImport.count', -1) do
      delete :destroy, id: @recibo_import
    end

    assert_redirected_to recibo_imports_path
  end
end
