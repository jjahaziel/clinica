class PacientesController < InheritedResources::Base


  # GET /pacientees
  # GET /pacientees.json
  def index
    @pacientes = Paciente.all
    # if User.current_user == :admin
    # else
    #   @pacientes = @pacientes.where(:users => { :colegio_id => User.current_user.colegio_id })
    # end
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: PacienteDatatable.new(view_context) }
    end
  end

   # GET /pacientees/new
   def new
    @paciente = Paciente.new
    @paciente.build_persona
    # @paciente.user.colegio_id = User.current_user.colegio_id
  end

  # GET /pacientes/1
  # GET /pacientes/1.json
  def show
    @paciente = Paciente.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb

      format.pdf do
        pdf = PacientePdf.new(@paciente, view_context)
        send_data pdf.render, filename: "paciente_#{@paciente.id}.pdf",
        type: "application/pdf",
        disposition: "inline"
      end

      format.json { render json: @paciente }
    end
  end

  private

  def set_paciente
    @paciente = Paciente.find(params[:id])
  end

  def paciente_params
    params.require(:paciente).permit(:numero_paciente, persona_attributes: [
     :id,
     :cedula, 
     :primer_nombre, 
     :segundo_nombre, 
     :primer_apellido, 
     :segundo_apellido, 
     :apellido_casada, 
     :fecha_nacimiento, 
     :sexo, 
     :seguro_social, 
     :direccion, 
     :telefono, 
     :contacto_emergencia, 
     :telefono_emergencia,
     :_destroy])
  end
end

