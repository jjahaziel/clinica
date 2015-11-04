class ServicioTiposController < InheritedResources::Base

  private

    def servicio_tipo_params
      params.require(:servicio_tipo).permit(:tipo, :descripcion)
    end
end

