class CreateAtenciones < ActiveRecord::Migration
  def change
    create_table :atenciones do |t|
      t.decimal :cantidad
      t.decimal :descuento
      t.references :recibo, index: true, foreign_key: true
      t.references :servicio, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
