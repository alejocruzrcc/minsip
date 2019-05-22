require 'test_helper'

class ActividadesControllerTest < ActionController::TestCase
  setup do
    skip
    @actividad = Actividad(:one)
  end

  test "should get index" do
    skip
    get :index
    assert_response :success
    assert_not_nil assigns(:actividad)
  end

  test "should get new" do
    skip
    get :new
    assert_response :success
  end

  test "should create actividad" do
    skip
    assert_difference('Actividad.count') do
      post :create, actividad: { created_at: @actividad.created_at, fechacreacion: @actividad.fechacreacion, fechadeshabilitacion: @actividad.fechadeshabilitacion, nombre: @actividad.nombre, observaciones: @actividad.observaciones, updated_at: @actividad.updated_at }
    end

    assert_redirected_to actividad_path(assigns(:actividad))
  end

  test "should show actividad" do
    skip
    get :show, id: @actividad
    assert_response :success
  end

  test "should get edit" do
    skip
    get :edit, id: @actividad
    assert_response :success
  end

  test "should update actividad" do
    skip
    patch :update, id: @actividad, actividad: { created_at: @actividad.created_at, fechacreacion: @actividad.fechacreacion, fechadeshabilitacion: @actividad.fechadeshabilitacion, nombre: @actividad.nombre, observaciones: @actividad.observaciones, updated_at: @actividad.updated_at }
    assert_redirected_to actividad_path(assigns(:actividad))
  end

  test "should destroy actividad" do
    skip
    assert_difference('Actividad.count', -1) do
      delete :destroy, id: @actividad
    end

    assert_redirected_to actividades_path
  end
end
