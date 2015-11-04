class PacienteImport
  # switch to ActiveModel::Model in Rails 4
  extend ActiveModel::Model
  include ActiveModel::Conversion
  include ActiveModel::Validations

  attr_accessor :file

  def initialize(attributes = {})
    attributes.each { |name, value| send("#{name}=", value) }
  end

  def persisted?
    false
  end

  def save
    if imported_pacientes.map(&:valid?).all?
      imported_pacientes.each(&:save!)
      true
    else
      imported_pacientes.each_with_index do |paciente, index|
        paciente.errors.full_messages.each do |message|
          errors.add :base, "Row #{index+2}: #{message}"
        end
      end
      false
    end
  end

  def imported_pacientes
    @imported_pacientes ||= load_imported_pacientes
  end

  def load_imported_pacientes
    spreadsheet = open_spreadsheet
    header = spreadsheet.row(1)
    (2..spreadsheet.last_row).map do |i|
      row = Hash[[header, spreadsheet.row(i)].transpose]

      # numero_paciente = row["id"]
      paciente = Paciente.find_by_id(row["id"]) || Paciente.new
      paciente.build_persona
      # paciente.persona.role = :paciente

      paciente.numero_paciente = row["id"]    
      paciente.persona.cedula = row["cedula"]
      paciente.persona.primer_apellido = row["primer_apellido"]
      paciente.persona.segundo_apellido = row["segundo_apellido"]
      paciente.persona.apellido_casada = row["apellido_casada"]
      paciente.persona.primer_nombre = row["primer_nombre"]
      paciente.persona.segundo_nombre = row["segundo_nombre"]
      paciente.persona.telefono = row["telefono"]
      paciente.persona.seguro_social = row["seguro_social"]
      paciente.persona.contacto_emergencia = row["contacto_emergencia"]
      paciente.persona.telefono_emergencia = row["telefono_emergencia"]
      paciente.persona.direccion = row["direccion"]

      # sexo
      # sexo = row["sexo"] unless row["sexo"].nil?
      # if sexo == "Masculino" || sexo == true
      #   paciente.persona.sexo = true
      # elsif sexo == "Femenino" || sexo == false
      #   paciente.persona.sexo = false
      # end
      paciente.persona.sexo = row["sexo"]

      # fecha
      # d = Date.strptime(row["fecha_nacimiento"], "%m/%d/%Y") unless row["fecha_nacimiento"].nil?
      # paciente.persona.fecha_nacimiento = d      
      paciente.persona.fecha_nacimiento = row["fecha_nacimiento"]

      # dominio_colegio = "@colegioclaret.edu.pa"   # este campo se debe obtener de otro lugar
      # paciente.persona.email = (id_paciente + dominio_colegio).gsub(/\s+/, "")
      # paciente.persona.password = row["password"]

      paciente
    end
  end

  def open_spreadsheet
    case File.extname(file.original_filename)
    # when ".csv" then Roo::CSV.new(file.path, csv_options: {encoding: Encoding::ISO_8859_1})
    when ".csv" then Roo::CSV.new(file.path)
  else raise "Unknown file type: #{file.original_filename}"
  end
end

# convert date
def dateformat(params)
  Date.new(params[:year],params[:day],params[:month])
end

end
