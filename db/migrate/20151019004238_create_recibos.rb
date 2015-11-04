class CreateRecibos < ActiveRecord::Migration
  def change
    create_table :recibos do |t|
      t.integer :numero_recibo
      t.string :nombre
      t.decimal :total
      t.decimal :total_porcentaje_doctor
      t.decimal :total_porcenteje_clinica
      t.decimal :total_porcentaje_laboratorio
      t.references :paciente, index: true, foreign_key: true
      t.references :doctor, index: true, foreign_key: true
      t.references :caja, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
