class Persona < ActiveRecord::Base
	include PgSearch

	pg_search_scope :quick_search, 
	against: [:cedula, 
		:primer_nombre, 
		:segundo_nombre, 
		:primer_apellido, 
		:segundo_apellido, 
		:apellido_casada]

	# Relaciones
	has_one :user
	has_one :paciente
	has_one :doctor
	has_one :caja

	def name
		"#{primer_apellido} #{segundo_apellido}, #{primer_nombre} #{segundo_nombre}"   
	end

	# Validaciones
	# validates :cedula, :uniqueness => { :case_sensitive => false }

	# Todo a mayusculas
	def cedula=(val)
		self[:cedula] = val.upcase unless val.nil?
	end
	def primer_apellido=(val)
		self[:primer_apellido] = val.upcase  unless val.nil? 
	end
	def segundo_apellido=(val)
		self[:segundo_apellido] = val.upcase unless val.nil?
	end
	def apellido_casada=(val)
		self[:apellido_casada] = val.upcase unless val.nil?
	end
	def primer_nombre=(val)
		self[:primer_nombre] = val.upcase unless val.nil?
	end
	def segundo_nombre=(val)
		self[:segundo_nombre] = val.upcase unless val.nil?
	end

end


