class CreateDoctores < ActiveRecord::Migration
  def change
    create_table :doctores do |t|
      t.string :numero_doctor
      t.text :especialidades
      t.references :persona, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
