json.array!(@servicio_tipos) do |servicio_tipo|
  json.extract! servicio_tipo, :id, :tipo, :descripcion
  json.url servicio_tipo_url(servicio_tipo, format: :json)
end
