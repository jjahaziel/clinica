json.array!(@servicios) do |servicio|
  json.extract! servicio, :id, :nombre, :codigo, :precio, :porcentaje_clinica, :porcentaje_doctor, :porcentaje_laboratorio, :servicio_tipo_id
  json.url servicio_url(servicio, format: :json)
end
