class CreateCajas < ActiveRecord::Migration
  def change
    create_table :cajas do |t|
      t.string :numero_cajero
      t.references :persona, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
