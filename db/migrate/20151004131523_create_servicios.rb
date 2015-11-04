class CreateServicios < ActiveRecord::Migration
  def change
    create_table :servicios do |t|
      t.string :nombre
      t.string :codigo
      t.decimal :precio
      t.decimal :porcentaje_clinica
      t.decimal :porcentaje_doctor
      t.decimal :porcentaje_laboratorio
      t.references :servicio_tipo, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
