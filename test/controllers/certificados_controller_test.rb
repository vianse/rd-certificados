require 'test_helper'

class CertificadosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @certificado = certificados(:one)
  end

  test "should get index" do
    get certificados_url
    assert_response :success
  end

  test "should get new" do
    get new_certificado_url
    assert_response :success
  end

  test "should create certificado" do
    assert_difference('Certificado.count') do
      post certificados_url, params: { certificado: { descargas: @certificado.descargas, estado: @certificado.estado, grupoid: @certificado.grupoid, imagen: @certificado.imagen, nombre: @certificado.nombre, serie: @certificado.serie, texto: @certificado.texto } }
    end

    assert_redirected_to certificado_url(Certificado.last)
  end

  test "should show certificado" do
    get certificado_url(@certificado)
    assert_response :success
  end

  test "should get edit" do
    get edit_certificado_url(@certificado)
    assert_response :success
  end

  test "should update certificado" do
    patch certificado_url(@certificado), params: { certificado: { descargas: @certificado.descargas, estado: @certificado.estado, grupoid: @certificado.grupoid, imagen: @certificado.imagen, nombre: @certificado.nombre, serie: @certificado.serie, texto: @certificado.texto } }
    assert_redirected_to certificado_url(@certificado)
  end

  test "should destroy certificado" do
    assert_difference('Certificado.count', -1) do
      delete certificado_url(@certificado)
    end

    assert_redirected_to certificados_url
  end
end
