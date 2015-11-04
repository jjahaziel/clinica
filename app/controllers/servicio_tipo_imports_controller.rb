class ServicioTipoImportsController < ApplicationController

  # before_filter :authenticate_user!

  # load_and_authorize_resource
  
  def new
    @servicio_tipo_import = ServicioTipoImport.new
  end

  def create
    @servicio_tipo_import = ServicioTipoImport.new(params[:servicio_tipo_import])
    if @servicio_tipo_import.save
      redirect_to servicio_tipos_path, notice: "Imported servicio_tipos successfully."
    else
      render :new
    end
  end
end
