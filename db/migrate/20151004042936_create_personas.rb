class CreatePersonas < ActiveRecord::Migration
  def change
    create_table :personas do |t|
      t.string :cedula
      t.string :primer_nombre
      t.string :segundo_nombre
      t.string :primer_apellido
      t.string :segundo_apellido
      t.string :apellido_casada
      t.date :fecha_nacimiento
      t.string :sexo
      t.string :seguro_social
      t.text :direccion
      t.string :telefono
      t.string :contacto_emergencia
      t.string :telefono_emergencia

      t.timestamps null: false
    end
  end
end
