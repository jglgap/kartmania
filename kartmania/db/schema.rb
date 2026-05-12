# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 2026_05_12_085946) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "circuitos", force: :cascade do |t|
    t.string "nombre", null: false
    t.string "kilometros", null: false
    t.text "descripcion"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cliente_reservas", force: :cascade do |t|
    t.string "nombre", null: false
    t.string "email", null: false
    t.string "telefono"
    t.string "dni", null: false
    t.bigint "cliente_id"
    t.bigint "reserva_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "es_titular", default: false, null: false
    t.index ["cliente_id"], name: "index_cliente_reservas_on_cliente_id"
    t.index ["reserva_id"], name: "index_cliente_reservas_on_reserva_id"
  end

  create_table "clientes", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "nombre"
    t.string "direccion"
    t.string "ciudad"
    t.string "provincia"
    t.string "codigo_postal"
    t.string "telefono"
    t.float "mejor_tiempo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_clientes_on_email", unique: true
    t.index ["reset_password_token"], name: "index_clientes_on_reset_password_token", unique: true
  end

  create_table "google_tokens", force: :cascade do |t|
    t.text "access_token"
    t.text "refresh_token"
    t.datetime "expires_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "karts", force: :cascade do |t|
    t.integer "tipo", default: 0, null: false
    t.integer "estado", default: 0, null: false
    t.bigint "circuito_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["circuito_id"], name: "index_karts_on_circuito_id"
  end

  create_table "participantes", force: :cascade do |t|
    t.integer "estado", default: 2, null: false
    t.date "fecha_solicitud", null: false
    t.date "fecha_confirmacion"
    t.bigint "cliente_id", null: false
    t.bigint "torneo_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "google_event_id"
    t.index ["cliente_id"], name: "index_participantes_on_cliente_id"
    t.index ["torneo_id"], name: "index_participantes_on_torneo_id"
  end

  create_table "plans", force: :cascade do |t|
    t.string "nombre", null: false
    t.text "descripcion"
    t.decimal "precio", precision: 8, scale: 2, null: false
    t.integer "max_participantes", null: false
    t.bigint "circuito_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["circuito_id"], name: "index_plans_on_circuito_id"
  end

  create_table "reservas", force: :cascade do |t|
    t.datetime "fecha", null: false
    t.integer "estado", default: 2, null: false
    t.bigint "plan_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["plan_id"], name: "index_reservas_on_plan_id"
  end

  create_table "torneos", force: :cascade do |t|
    t.string "nombre", null: false
    t.text "descripcion"
    t.datetime "fecha_torneo", null: false
    t.string "primer_puesto"
    t.string "segundo_puesto"
    t.string "tercer_puesto"
    t.decimal "primer_premio", precision: 8, scale: 2
    t.decimal "segundo_premio", precision: 8, scale: 2
    t.decimal "tercer_premio", precision: 8, scale: 2
    t.integer "numero_participantes", null: false
    t.integer "dificultad", default: 0, null: false
    t.bigint "circuito_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["circuito_id"], name: "index_torneos_on_circuito_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "tipo"
    t.string "nombre"
    t.string "direccion"
    t.string "ciudad"
    t.string "provincia"
    t.string "codigo_postal"
    t.string "telefono"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "cliente_reservas", "clientes"
  add_foreign_key "cliente_reservas", "reservas"
  add_foreign_key "karts", "circuitos"
  add_foreign_key "participantes", "clientes"
  add_foreign_key "participantes", "torneos"
  add_foreign_key "plans", "circuitos"
  add_foreign_key "reservas", "plans"
  add_foreign_key "torneos", "circuitos"
end
