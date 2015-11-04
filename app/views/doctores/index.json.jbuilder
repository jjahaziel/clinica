json.array!(@doctores) do |doctor|
  json.extract! doctor, :id, :numero_doctor, :especialidades, :persona_id
  json.url doctor_url(doctor, format: :json)
end
