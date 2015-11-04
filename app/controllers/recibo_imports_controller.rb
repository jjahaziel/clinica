class ReciboImportsController  < ApplicationController

  # before_filter :authenticate_user!

  # load_and_authorize_resource
  
  def new
    @recibo_import = ReciboImport.new
  end

  def create
    @recibo_import = ReciboImport.new(params[:recibo_import])
    if @recibo_import.save
      redirect_to recibos_path, notice: "Imported recibos successfully."
    else
      render :new
    end
  end
end
