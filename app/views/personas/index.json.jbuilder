json.array!(@personas) do |persona|
  json.extract! persona, :id, :cedula, :primer_nombre, :segundo_nombre, :primer_apellido, :segundo_apellido, :apellido_casada, :fecha_nacimiento, :sexo, :seguro_social, :direccion, :telefono, :contacto_emergencia, :telefono_emergencia
  json.url persona_url(persona, format: :json)
end
