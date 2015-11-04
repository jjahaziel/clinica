# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20151028234343) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "atenciones", force: :cascade do |t|
    t.decimal  "cantidad"
    t.decimal  "descuento"
    t.integer  "recibo_id"
    t.integer  "servicio_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "atenciones", ["recibo_id"], name: "index_atenciones_on_recibo_id", using: :btree
  add_index "atenciones", ["servicio_id"], name: "index_atenciones_on_servicio_id", using: :btree

  create_table "cajas", force: :cascade do |t|
    t.string   "numero_cajero"
    t.integer  "persona_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "cajas", ["persona_id"], name: "index_cajas_on_persona_id", using: :btree

  create_table "doctores", force: :cascade do |t|
    t.string   "numero_doctor"
    t.text     "especialidades"
    t.integer  "persona_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "doctores", ["persona_id"], name: "index_doctores_on_persona_id", using: :btree

  create_table "pacientes", force: :cascade do |t|
    t.integer  "numero_paciente"
    t.integer  "persona_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "pacientes", ["persona_id"], name: "index_pacientes_on_persona_id", using: :btree

  create_table "personas", force: :cascade do |t|
    t.string   "cedula"
    t.string   "primer_nombre"
    t.string   "segundo_nombre"
    t.string   "primer_apellido"
    t.string   "segundo_apellido"
    t.string   "apellido_casada"
    t.date     "fecha_nacimiento"
    t.string   "sexo"
    t.string   "seguro_social"
    t.text     "direccion"
    t.string   "telefono"
    t.string   "contacto_emergencia"
    t.string   "telefono_emergencia"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  create_table "pg_search_documents", force: :cascade do |t|
    t.text     "content"
    t.integer  "searchable_id"
    t.string   "searchable_type"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "pg_search_documents", ["searchable_type", "searchable_id"], name: "index_pg_search_documents_on_searchable_type_and_searchable_id", using: :btree

  create_table "recibos", force: :cascade do |t|
    t.integer  "numero_recibo"
    t.string   "nombre"
    t.decimal  "total"
    t.decimal  "total_porcentaje_doctor"
    t.decimal  "total_porcenteje_clinica"
    t.decimal  "total_porcentaje_laboratorio"
    t.integer  "paciente_id"
    t.integer  "doctor_id"
    t.integer  "caja_id"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  add_index "recibos", ["caja_id"], name: "index_recibos_on_caja_id", using: :btree
  add_index "recibos", ["doctor_id"], name: "index_recibos_on_doctor_id", using: :btree
  add_index "recibos", ["paciente_id"], name: "index_recibos_on_paciente_id", using: :btree

  create_table "servicio_tipos", force: :cascade do |t|
    t.string   "tipo"
    t.text     "descripcion"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "servicios", force: :cascade do |t|
    t.string   "nombre"
    t.string   "codigo"
    t.decimal  "precio"
    t.decimal  "porcentaje_clinica"
    t.decimal  "porcentaje_doctor"
    t.decimal  "porcentaje_laboratorio"
    t.integer  "servicio_tipo_id"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "servicios", ["servicio_tipo_id"], name: "index_servicios_on_servicio_tipo_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.integer  "persona_id"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["persona_id"], name: "index_users_on_persona_id", using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "atenciones", "recibos"
  add_foreign_key "atenciones", "servicios"
  add_foreign_key "cajas", "personas"
  add_foreign_key "doctores", "personas"
  add_foreign_key "recibos", "cajas"
  add_foreign_key "recibos", "doctores"
  add_foreign_key "recibos", "pacientes"
  add_foreign_key "servicios", "servicio_tipos"
  add_foreign_key "users", "personas"
end
