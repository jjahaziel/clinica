json.array!(@cajas) do |caja|
  json.extract! caja, :id, :numero_cajero, :persona_id
  json.url caja_url(caja, format: :json)
end
