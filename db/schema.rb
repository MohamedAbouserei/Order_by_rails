# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_04_14_164329) do

  create_table "fgroups", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "model_id"
    t.index ["model_id"], name: "index_fgroups_on_model_id"
  end

  create_table "forders", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "meal", limit: 50, null: false
    t.string "resturant", limit: 50, null: false
    t.string "image", limit: 50
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "model_id"
    t.index ["model_id"], name: "index_forders_on_model_id"
  end

  create_table "friends", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.boolean "action", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "request_id"
    t.bigint "reciver_id"
    t.index ["reciver_id"], name: "index_friends_on_reciver_id"
    t.index ["request_id"], name: "index_friends_on_request_id"
  end

  create_table "groupuser", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "model_id", null: false
    t.bigint "fgroup_id", null: false
    t.index ["fgroup_id"], name: "index_groupuser_on_fgroup_id"
    t.index ["model_id"], name: "index_groupuser_on_model_id"
  end

  create_table "invitations", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "owner_id"
    t.bigint "model_id", null: false
    t.bigint "fgroup_id", null: false
    t.index ["fgroup_id"], name: "index_invitations_on_fgroup_id"
    t.index ["model_id"], name: "index_invitations_on_model_id"
    t.index ["owner_id"], name: "index_invitations_on_owner_id"
  end

  create_table "models", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.boolean "admin", default: false
    t.string "profileimage"
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "username"
    t.index ["email"], name: "index_models_on_email", unique: true
    t.index ["reset_password_token"], name: "index_models_on_reset_password_token", unique: true
    t.index ["username"], name: "index_models_on_username", unique: true
  end

  create_table "notifcations", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "link"
    t.string "title", limit: 50, default: "", null: false
    t.string "color", default: "blue"
    t.string "icon"
    t.boolean "seen", default: false
    t.boolean "watch", default: false
    t.string "text", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "model_id"
    t.index ["model_id"], name: "index_notifcations_on_model_id"
  end

  create_table "orderuser", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "model_id", null: false
    t.bigint "forder_id", null: false
    t.string "meal"
    t.index ["forder_id"], name: "index_orderuser_on_forder_id"
    t.index ["model_id"], name: "index_orderuser_on_model_id"
  end

  add_foreign_key "fgroups", "models"
  add_foreign_key "forders", "models"
  add_foreign_key "friends", "models", column: "reciver_id"
  add_foreign_key "friends", "models", column: "request_id"
  add_foreign_key "groupuser", "fgroups"
  add_foreign_key "groupuser", "models"
  add_foreign_key "invitations", "fgroups"
  add_foreign_key "invitations", "models"
  add_foreign_key "invitations", "models", column: "owner_id"
  add_foreign_key "notifcations", "models"
  add_foreign_key "orderuser", "forders"
  add_foreign_key "orderuser", "models"
end
