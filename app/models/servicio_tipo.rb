class ServicioTipo < ActiveRecord::Base

	def name
		"#{tipo}"   
	end

  	# Validaciones
  	validates :tipo, :uniqueness => { :case_sensitive => false }

	# Todo a mayusculas
	def tipo=(val)
		self[:tipo] = val.upcase unless val.nil?
	end

end


