json.extract! usuario, :id, :name, :lastName, :email, :groupId, :userId, :created_at, :updated_at
json.url usuario_url(usuario, format: :json)
