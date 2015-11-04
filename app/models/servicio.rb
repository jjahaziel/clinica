class Servicio < ActiveRecord::Base
	include PgSearch

	pg_search_scope :quick_search, 
	against: [:nombre, :codigo],
	:associated_against => {
		:servicio_tipo => [:tipo]}
		
		belongs_to :servicio_tipo, foreign_key: "servicio_tipo_id" 
		
		def nombre=(val)
			self[:nombre] = val.upcase unless val.nil?
		end

		def name
			"#{nombre}"   
		end

	end


