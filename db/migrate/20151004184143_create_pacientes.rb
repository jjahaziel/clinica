class CreatePacientes < ActiveRecord::Migration
  def change
    create_table :pacientes do |t|
      t.integer :numero_paciente
      t.belongs_to :persona, index: true

      t.timestamps null: false
    end
  end
end
