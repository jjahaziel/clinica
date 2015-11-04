class PacienteImportsController < ApplicationController

  # before_filter :authenticate_user!

  # load_and_authorize_resource
  
  def new
    @paciente_import = PacienteImport.new
  end

  def create
    @paciente_import = PacienteImport.new(params[:paciente_import])
    if @paciente_import.save
      redirect_to pacientes_path, notice: "Imported pacientes successfully."
    else
      render :new
    end
  end
end
