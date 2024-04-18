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

ActiveRecord::Schema[7.1].define(version: 2024_04_18_234006) do
  create_table "comentarios", force: :cascade do |t|
    t.string "titulo", limit: 50
    t.string "corpo", limit: 200
    t.integer "usuario_id", null: false
    t.integer "carona_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["carona_id"], name: "index_comentarios_on_carona_id"
    t.index ["usuario_id"], name: "index_comentarios_on_usuario_id"
  end

  create_table "motorista", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "passageiro_viagems", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "passageiros", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "usuarios", force: :cascade do |t|
    t.string "nome", limit: 100
    t.string "iduff", limit: 11
    t.integer "tipo"
    t.integer "reputacao"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "motorista_id", null: false
    t.integer "usuario_id", null: false
    t.integer "passageiro_id", null: false
    t.index ["motorista_id"], name: "index_usuarios_on_motorista_id"
    t.index ["passageiro_id"], name: "index_usuarios_on_passageiro_id"
    t.index ["usuario_id"], name: "index_usuarios_on_usuario_id"
  end

  create_table "viagems", force: :cascade do |t|
    t.string "partida", limit: 100
    t.string "destino", limit: 100
    t.date "horario_partida"
    t.integer "motorista_id", null: false
    t.integer "passageiro_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["motorista_id"], name: "index_viagems_on_motorista_id"
    t.index ["passageiro_id"], name: "index_viagems_on_passageiro_id"
  end

  add_foreign_key "comentarios", "caronas"
  add_foreign_key "comentarios", "usuarios"
  add_foreign_key "usuarios", "motorista", column: "motorista_id"
  add_foreign_key "usuarios", "passageiros"
  add_foreign_key "usuarios", "usuarios"
  add_foreign_key "viagems", "motorista", column: "motorista_id"
  add_foreign_key "viagems", "passageiros"
end
