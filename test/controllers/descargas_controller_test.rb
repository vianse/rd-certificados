require 'test_helper'

class DescargasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @descarga = descargas(:one)
  end

  test "should get index" do
    get descargas_url
    assert_response :success
  end

  test "should get new" do
    get new_descarga_url
    assert_response :success
  end

  test "should create descarga" do
    assert_difference('Descarga.count') do
      post descargas_url, params: { descarga: { certificado: @descarga.certificado, email: @descarga.email } }
    end

    assert_redirected_to descarga_url(Descarga.last)
  end

  test "should show descarga" do
    get descarga_url(@descarga)
    assert_response :success
  end

  test "should get edit" do
    get edit_descarga_url(@descarga)
    assert_response :success
  end

  test "should update descarga" do
    patch descarga_url(@descarga), params: { descarga: { certificado: @descarga.certificado, email: @descarga.email } }
    assert_redirected_to descarga_url(@descarga)
  end

  test "should destroy descarga" do
    assert_difference('Descarga.count', -1) do
      delete descarga_url(@descarga)
    end

    assert_redirected_to descargas_url
  end
end
