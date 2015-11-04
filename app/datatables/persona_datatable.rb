class PersonaDatatable < AjaxDatatablesRails::Base
# uncomment the appropriate paginator module,
  # depending on gems available in your project.
  # include AjaxDatatablesRails::Extensions::Kaminari
  include AjaxDatatablesRails::Extensions::WillPaginate
  # include AjaxDatatablesRails::Extensions::SimplePaginator

  def_delegator :@view, :link_to
  def_delegator :@view, :h
  def_delegator :@view, :mail_to

  # or define them in one pass
  def_delegators :@view, :link_to, :h, :mailto, :edit_persona_path, :persona_path


  def sortable_columns
    # Declare strings in this format: ModelName.column_name
    @sortable_columns ||= []
  end

  def searchable_columns
    # Declare strings in this format: ModelName.column_name
    @searchable_columns ||= []
  end

  private

  def data
    records.map do |record|
      [
        # comma separated list of the values for each cell of a table row
        # example: record.attribute,
        record.name,
        record.cedula,
        record.telefono,
        record.contacto_emergencia,
        record.telefono_emergencia,
        link_to("Mostrar", persona_path(record)),
        link_to("Editar", edit_persona_path(record))
      ]
    end
  end

  def get_raw_records
    personas = Persona.all
    personas = personas.order("#{sort_column} #{sort_direction}")
    # personas = personas.page(page).per_page(per_page)
    if params[:sSearch].present?
      personas = personas.quick_search(params[:sSearch])
    end
    personas
  end

  def personas
    personas = get_raw_records
    personas 
  end

  def page
    params[:iDisplayStart].to_i/per_page + 1
  end

  def per_page
    params[:iDisplayLength].to_i > 0 ? params[:iDisplayLength].to_i : 10
  end

  def sort_column
    columns = %w[primer_apellido cedula telefono contacto_emergencia telefono_emergencia not_orderable not_orderable]
    columns[params[:iSortCol_0].to_i] 
  end

  def sort_direction
    params[:sSortDir_0] == "desc" ? "desc" : "asc"
  end

end
