class ServicioDatatable < AjaxDatatablesRails::Base
# uncomment the appropriate paginator module,
  # depending on gems available in your project.
  # include AjaxDatatablesRails::Extensions::Kaminari
  include AjaxDatatablesRails::Extensions::WillPaginate
  # include AjaxDatatablesRails::Extensions::SimplePaginator

  def_delegator :@view, :link_to
  def_delegator :@view, :h
  def_delegator :@view, :mail_to
  def_delegator :@view, :number_to_currency

  # or define them in one pass
  def_delegators :@view, :link_to, :h, :mailto, :number_to_currency, :edit_servicio_path, :servicio_path


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
        record.nombre,
        record.codigo,
        number_to_currency(record.precio),
        record.porcentaje_clinica,
        record.porcentaje_doctor,
        record.porcentaje_laboratorio,
        record.servicio_tipo.name,
        link_to("Mostrar", servicio_path(record)),
        link_to("Editar", edit_servicio_path(record))
      ]
    end
  end

  def get_raw_records
    servicios = Servicio.joins(:servicio_tipo).all
    servicios = servicios.order("#{sort_column} #{sort_direction}")
    # servicios = servicios.page(page).per_page(per_page)
    if params[:sSearch].present?
      servicios = servicios.quick_search(params[:sSearch])
    end
    servicios
  end

  def servicios
    servicios = get_raw_records
    servicios 
  end

  def page
    params[:iDisplayStart].to_i/per_page + 1
  end

  def per_page
    params[:iDisplayLength].to_i > 0 ? params[:iDisplayLength].to_i : 10
  end

  def sort_column
    columns = %w[nombre codigo precio porcentaje_clinica porcentaje_doctor porcentaje_laboratorio tipo not_orderable not_orderable]
    columns[params[:iSortCol_0].to_i] 
  end

  def sort_direction
    params[:sSortDir_0] == "desc" ? "desc" : "asc"
  end

end
