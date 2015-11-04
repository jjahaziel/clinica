class CreateServicioTipos < ActiveRecord::Migration
  def change
    create_table :servicio_tipos do |t|
      t.string :tipo
      t.text :descripcion

      t.timestamps null: false
    end
  end
end
