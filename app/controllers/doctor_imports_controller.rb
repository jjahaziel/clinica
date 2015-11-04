class DoctorImportsController < ApplicationController

  # before_filter :authenticate_user!

  # load_and_authorize_resource
  
  def new
    @doctor_import = DoctorImport.new
  end

  def create
    @doctor_import = DoctorImport.new(params[:doctor_import])
    if @doctor_import.save
      redirect_to doctores_path, notice: "Imported doctores successfully."
    else
      render :new
    end
  end
end
