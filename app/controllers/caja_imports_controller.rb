class CajaImportsController  < ApplicationController

  # before_filter :authenticate_user!

  # load_and_authorize_resource
  
  def new
    @caja_import = CajaImport.new
  end

  def create
    @caja_import = CajaImport.new(params[:caja_import])
    if @caja_import.save
      redirect_to cajas_path, notice: "Imported cajas successfully."
    else
      render :new
    end
  end
end
