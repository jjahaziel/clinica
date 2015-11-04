class CajasController < InheritedResources::Base

   # GET /alumnoes/new
   def new
   	@caja = Caja.new
   	@caja.build_persona
    # @caja.user.role = :alumno
    # @caja.user.colegio_id = User.current_user.colegio_id
end

private

def set_caja
	@caja = Caja.find(params[:id])
end

def caja_params
	params.require(:caja).permit(:numero_cajero, persona_attributes: [
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

