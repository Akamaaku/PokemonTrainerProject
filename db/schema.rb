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

ActiveRecord::Schema.define(version: 2019_02_12_012937) do

  create_table "element_types", force: :cascade do |t|
    t.string "typeName"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "games", force: :cascade do |t|
    t.string "title"
    t.date "dateCreated"
    t.string "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "generations", force: :cascade do |t|
    t.string "generation"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pokemons", force: :cascade do |t|
    t.integer "pokedexID"
    t.string "name"
    t.string "pokedexDescription"
    t.string "evolveTo"
    t.string "evolveFrom"
    t.string "secondaryType"
    t.string "imageURL"
    t.integer "generation_id"
    t.integer "element_type_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["element_type_id"], name: "index_pokemons_on_element_type_id"
    t.index ["generation_id"], name: "index_pokemons_on_generation_id"
  end

  create_table "team_members", force: :cascade do |t|
    t.string "nickname"
    t.integer "position"
    t.integer "pokemon_id"
    t.integer "team_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["pokemon_id"], name: "index_team_members_on_pokemon_id"
    t.index ["team_id"], name: "index_team_members_on_team_id"
  end

  create_table "teams", force: :cascade do |t|
    t.string "teamName"
    t.integer "trainer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["trainer_id"], name: "index_teams_on_trainer_id"
  end

  create_table "trainers", force: :cascade do |t|
    t.string "name"
    t.string "trainerType"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
