class ServicioImportsController < ApplicationController

  # before_filter :authenticate_user!

  # load_and_authorize_resource
  
  def new
    @servicio_import = ServicioImport.new
  end

  def create
    @servicio_import = ServicioImport.new(params[:servicio_import])
    if @servicio_import.save
      redirect_to servicios_path, notice: "Imported servicios successfully."
    else
      render :new
    end
  end
end
