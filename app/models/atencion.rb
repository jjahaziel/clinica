class Atencion < ActiveRecord::Base
  
      belongs_to :recibo  
      belongs_to :servicio

  def name
    "#{nombre}"   
  end

end


