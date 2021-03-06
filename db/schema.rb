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

ActiveRecord::Schema.define(version: 20190516042716) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: :cascade do |t|
    t.string "email"
    t.string "password"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "certificados", force: :cascade do |t|
    t.string "imagen"
    t.string "nombre"
    t.string "texto"
    t.string "grupoid"
    t.string "serie"
    t.string "estado"
    t.string "descargas"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "template"
  end

  create_table "descargas", force: :cascade do |t|
    t.string "certificado"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "groups", force: :cascade do |t|
    t.string "name"
    t.string "number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "usuarios", force: :cascade do |t|
    t.string "title"
    t.string "name"
    t.string "lastName"
    t.string "email"
    t.string "groupId"
    t.string "userId"
    t.string "folio"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "conteo", default: "0"
  end

  create_table "validacions", force: :cascade do |t|
    t.string "numero"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
