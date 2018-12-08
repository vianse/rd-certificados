require 'test_helper'

class ValidacionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @validacion = validacions(:one)
  end

  test "should get index" do
    get validacions_url
    assert_response :success
  end

  test "should get new" do
    get new_validacion_url
    assert_response :success
  end

  test "should create validacion" do
    assert_difference('Validacion.count') do
      post validacions_url, params: { validacion: { numero: @validacion.numero } }
    end

    assert_redirected_to validacion_url(Validacion.last)
  end

  test "should show validacion" do
    get validacion_url(@validacion)
    assert_response :success
  end

  test "should get edit" do
    get edit_validacion_url(@validacion)
    assert_response :success
  end

  test "should update validacion" do
    patch validacion_url(@validacion), params: { validacion: { numero: @validacion.numero } }
    assert_redirected_to validacion_url(@validacion)
  end

  test "should destroy validacion" do
    assert_difference('Validacion.count', -1) do
      delete validacion_url(@validacion)
    end

    assert_redirected_to validacions_url
  end
end
