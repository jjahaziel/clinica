json.array!(@pacientes) do |paciente|
  json.extract! paciente, :id, :numero_paciente, :persona_id
  json.url paciente_url(paciente, format: :json)
end
