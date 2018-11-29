json.extract! certificado, :id, :imagen, :nombre, :texto, :grupoid, :serie, :estado, :descargas, :created_at, :updated_at
json.url certificado_url(certificado, format: :json)
