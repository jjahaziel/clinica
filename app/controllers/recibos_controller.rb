class RecibosController < InheritedResources::Base

private

def recibo_params
	params.require(:recibo).permit(:numero_recibo, 
		:nombre, 
		:total, 
		:total_porcentaje_doctor, 
		:total_porcenteje_clinica, 
		:total_porcentaje_laboratorio, 
        atenciones_attributes: [:id, 
          :recibo_id, 
          :servicio_id, 
          :cantidad,
          :descuento, 
          :_destroy])
end
end

