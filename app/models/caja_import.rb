class CajaImport
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
    if imported_cajas.map(&:valid?).all?
      imported_cajas.each(&:save!)
      true
    else
      imported_cajas.each_with_index do |caja, index|
        caja.errors.full_messages.each do |message|
          errors.add :base, "Row #{index+2}: #{message}"
        end
      end
      false
    end
  end

  def imported_cajas
    @imported_cajas ||= load_imported_cajas
  end

  def load_imported_cajas
    spreadsheet = open_spreadsheet
    header = spreadsheet.row(1)
    (2..spreadsheet.last_row).map do |i|
      row = Hash[[header, spreadsheet.row(i)].transpose]

      # numero_caja = row["id"]
      caja = Caja.find_by_id(row["id"]) || Caja.new
      caja.build_persona
      # caja.persona.role = :caja

      caja.numero_cajero = row["id"]    
      caja.persona.cedula = row["cedula"]
      caja.persona.primer_apellido = row["primer_apellido"] || row["apellido"]
      caja.persona.segundo_apellido = row["segundo_apellido"]
      caja.persona.apellido_casada = row["apellido_casada"]
      caja.persona.primer_nombre = row["primer_nombre"] || row["nombre"]
      caja.persona.segundo_nombre = row["segundo_nombre"]
      caja.persona.telefono = row["telefono"]
      caja.persona.seguro_social = row["seguro_social"]
      caja.persona.contacto_emergencia = row["contacto_emergencia"]
      caja.persona.telefono_emergencia = row["telefono_emergencia"]
      caja.persona.direccion = row["direccion"]

      # sexo
      # sexo = row["sexo"] unless row["sexo"].nil?
      # if sexo == "Masculino" || sexo == true
      #   caja.persona.sexo = true
      # elsif sexo == "Femenino" || sexo == false
      #   caja.persona.sexo = false
      # end
      caja.persona.sexo = row["sexo"]

      # fecha
      # d = Date.strptime(row["fecha_nacimiento"], "%m/%d/%Y") unless row["fecha_nacimiento"].nil?
      # caja.persona.fecha_nacimiento = d      
      caja.persona.fecha_nacimiento = row["fecha_nacimiento"]

      # dominio_colegio = "@colegioclaret.edu.pa"   # este campo se debe obtener de otro lugar
      # caja.persona.email = (id_caja + dominio_colegio).gsub(/\s+/, "")
      # caja.persona.password = row["password"]

      caja
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
