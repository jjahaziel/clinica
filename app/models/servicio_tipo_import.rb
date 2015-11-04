class ServicioTipoImport 
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
    if imported_tipo_servicios.map(&:valid?).all?
      imported_tipo_servicios.each(&:save!)
      true
    else
      imported_tipo_servicios.each_with_index do |tipo_servicio, index|
        tipo_servicio.errors.full_messages.each do |message|
          errors.add :base, "Row #{index+2}: #{message}"
        end
      end
      false
    end
  end

  def imported_tipo_servicios
    @imported_tipo_servicios ||= load_imported_tipo_servicios
  end

  def load_imported_tipo_servicios
    spreadsheet = open_spreadsheet
    header = spreadsheet.row(1)
    (2..spreadsheet.last_row).map do |i|
      row = Hash[[header, spreadsheet.row(i)].transpose]

      tipo_servicio = ServicioTipo.find_by_id(row["id"]) || ServicioTipo.new

      tipo_servicio.tipo = row["name"]    
      tipo_servicio.descripcion = row["descripcion"]      

      tipo_servicio
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
