class Paciente < ActiveRecord::Base
	include PgSearch

	pg_search_scope :quick_search, 
	against: [:id],
	:associated_against => {
		:persona => [:cedula, 
			:primer_nombre, 
			:segundo_nombre, 
			:primer_apellido, 
			:segundo_apellido, 
			:apellido_casada]
		}

	# Relaciones
	belongs_to :persona
	accepts_nested_attributes_for :persona, :allow_destroy => true

	def name
		"#{persona.name}"   
	end

	def numero_paciente
		id
	end

end


