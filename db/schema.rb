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

ActiveRecord::Schema[7.1].define(version: 2024_06_05_174515) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "boards", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "team_id"
    t.string "name", null: false
    t.string "color"
    t.boolean "is_public", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["team_id"], name: "index_boards_on_team_id"
    t.index ["user_id"], name: "index_boards_on_user_id"
  end

  create_table "labels", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "board_id"
    t.string "name", null: false
    t.string "color", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["board_id"], name: "index_labels_on_board_id"
    t.index ["user_id"], name: "index_labels_on_user_id"
  end

  create_table "states", force: :cascade do |t|
    t.bigint "board_id"
    t.string "name", null: false
    t.integer "position", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["board_id"], name: "index_states_on_board_id"
  end

  create_table "task_comments", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "task_id"
    t.text "body", null: false
    t.string "filename"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["task_id"], name: "index_task_comments_on_task_id"
    t.index ["user_id"], name: "index_task_comments_on_user_id"
  end

  create_table "tasks", force: :cascade do |t|
    t.bigint "state_id"
    t.bigint "informer_user_id_id", null: false
    t.bigint "assignee_user_id_id"
    t.string "name", null: false
    t.integer "priority"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "label_id"
    t.index ["assignee_user_id_id"], name: "index_tasks_on_assignee_user_id_id"
    t.index ["informer_user_id_id"], name: "index_tasks_on_informer_user_id_id"
    t.index ["label_id"], name: "index_tasks_on_label_id"
    t.index ["state_id"], name: "index_tasks_on_state_id"
  end

  create_table "teams", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_boards", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "board_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["board_id"], name: "index_user_boards_on_board_id"
    t.index ["user_id"], name: "index_user_boards_on_user_id"
  end

  create_table "user_tasks", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "task_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["task_id"], name: "index_user_tasks_on_task_id"
    t.index ["user_id"], name: "index_user_tasks_on_user_id"
  end

  create_table "user_teams", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "team_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["team_id"], name: "index_user_teams_on_team_id"
    t.index ["user_id"], name: "index_user_teams_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name", null: false
    t.string "email", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "boards", "teams"
  add_foreign_key "boards", "users"
  add_foreign_key "labels", "boards"
  add_foreign_key "labels", "users"
  add_foreign_key "states", "boards"
  add_foreign_key "task_comments", "tasks"
  add_foreign_key "task_comments", "users"
  add_foreign_key "tasks", "labels"
  add_foreign_key "tasks", "states"
  add_foreign_key "tasks", "users", column: "assignee_user_id_id"
  add_foreign_key "tasks", "users", column: "informer_user_id_id"
  add_foreign_key "user_boards", "boards"
  add_foreign_key "user_boards", "users"
  add_foreign_key "user_tasks", "tasks"
  add_foreign_key "user_tasks", "users"
  add_foreign_key "user_teams", "teams"
  add_foreign_key "user_teams", "users"
end
