class AtencionesController < InheritedResources::Base

  private

    def atencion_params
      params.require(:atencion).permit(:cantidad, :descuento, :recibo_id, :servicio_id)
    end
end

