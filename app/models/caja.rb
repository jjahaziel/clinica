class Caja < ActiveRecord::Base
	
	belongs_to :persona


	accepts_nested_attributes_for :persona, :allow_destroy => true


	def name
		"#{persona.name}"   
	end

	def numero_caja
		id
	end

end


