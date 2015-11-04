json.array!(@atenciones) do |atencion|
  json.extract! atencion, :id, :cantidad, :descuento, :recibo_id, :servicio_id
  json.url atencion_url(atencion, format: :json)
end
