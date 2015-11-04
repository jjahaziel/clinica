class ServiciosController < InheritedResources::Base

	# GET /servicioes
  	# GET /servicioes.json
  	def index
  		@servicios = Servicio.all
    # if User.current_user == :admin
    # else
    #   @servicios = @servicios.where(:users => { :colegio_id => User.current_user.colegio_id })
    # end
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: ServicioDatatable.new(view_context) }
  end
end

private

def servicio_params
	params.require(:servicio).permit(:nombre, 
		:codigo, 
		:precio, 
		:porcentaje_clinica, 
		:porcentaje_doctor, 
		:porcentaje_laboratorio, 
		:servicio_tipo_id)
end
end

