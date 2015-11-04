class Recibo < ActiveRecord::Base

	belongs_to 	:paciente  
	belongs_to 	:doctor  
	belongs_to 	:caja  
	has_many		:atenciones
	has_many 		:servicios, :through => :atenciones 

	accepts_nested_attributes_for :atenciones, :reject_if => :all_blank, :allow_destroy => true

	def name
		"#{nombre}"   
	end

end


