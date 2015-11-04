class DoctoresController < InheritedResources::Base

   # GET /alumnoes/new
   def new
   	@doctor = Doctor.new
   	@doctor.build_persona
    # @doctor.user.role = :alumno
    # @doctor.user.colegio_id = User.current_user.colegio_id
end


private

def set_doctor
	@doctor = Doctor.find(params[:id])
end

def doctor_params
	params.require(:doctor).permit(:numero_doctor, 
		:especialidades, 
		persona_attributes: [
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

