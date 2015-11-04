class DoctorImport 
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
    if imported_doctores.map(&:valid?).all?
      imported_doctores.each(&:save!)
      true
    else
      imported_doctores.each_with_index do |doctor, index|
        doctor.errors.full_messages.each do |message|
          errors.add :base, "Row #{index+2}: #{message}"
        end
      end
      false
    end
  end

  def imported_doctores
    @imported_doctores ||= load_imported_doctores
  end

  def load_imported_doctores
    spreadsheet = open_spreadsheet
    header = spreadsheet.row(1)
    (2..spreadsheet.last_row).map do |i|
      row = Hash[[header, spreadsheet.row(i)].transpose]

      # numero_doctor = row["id"]
      doctor = Doctor.find_by_id(row["id"]) || Doctor.new
      doctor.build_persona
      # doctor.persona.role = :doctor

      doctor.numero_doctor = row["id"]   
      doctor.especialidades = row["especialidades"]  || row["especialidad"]
      doctor.persona.cedula = row["cedula"]
      doctor.persona.primer_apellido = row["primer_apellido"] || row["apellido"]
      doctor.persona.segundo_apellido = row["segundo_apellido"]
      doctor.persona.apellido_casada = row["apellido_casada"]
      doctor.persona.primer_nombre = row["primer_nombre"]  || row["nombre"]
      doctor.persona.segundo_nombre = row["segundo_nombre"]
      doctor.persona.telefono = row["telefono"]
      doctor.persona.seguro_social = row["seguro_social"]
      doctor.persona.contacto_emergencia = row["contacto_emergencia"]
      doctor.persona.telefono_emergencia = row["telefono_emergencia"]
      doctor.persona.direccion = row["direccion"]

      # sexo
      # sexo = row["sexo"] unless row["sexo"].nil?
      # if sexo == "Masculino" || sexo == true
      #   doctor.persona.sexo = true
      # elsif sexo == "Femenino" || sexo == false
      #   doctor.persona.sexo = false
      # end
      doctor.persona.sexo = row["sexo"]

      # fecha
      # d = Date.strptime(row["fecha_nacimiento"], "%m/%d/%Y") unless row["fecha_nacimiento"].nil?
      # doctor.persona.fecha_nacimiento = d      
      doctor.persona.fecha_nacimiento = row["fecha_nacimiento"]

      # dominio_colegio = "@colegioclaret.edu.pa"   # este campo se debe obtener de otro lugar
      # doctor.persona.email = (id_doctor + dominio_colegio).gsub(/\s+/, "")
      # doctor.persona.password = row["password"]

      doctor
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
