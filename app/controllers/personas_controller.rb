class PersonasController < InheritedResources::Base

	# load_and_authorize_resource

	# GET /personaes
  	# GET /personaes.json
  	def index
  		@personas = Persona.all
    # if User.current_user == :admin
    # else
    #   @personas = @personas.where(:users => { :colegio_id => User.current_user.colegio_id })
    # end
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: PersonaDatatable.new(view_context) }
  end
end

private

  def set_persona
    @persona = Persona.find(params[:id])
  end

def persona_params
	params.require(:persona).permit(:cedula, 
		:primer_nombre, 
		:segundo_nombre, 
		:primer_apellido, 
		:segundo_apellido, 
		:apellido_casada, :fecha_nacimiento, 
		:sexo, 
		:seguro_social, 
		:direccion, 
		:telefono, 
		:contacto_emergencia, 
		:telefono_emergencia)
end
end

