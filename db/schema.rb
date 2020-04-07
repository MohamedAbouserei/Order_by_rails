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

ActiveRecord::Schema.define(version: 2020_04_07_115316) do

  create_table "friends", options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.integer "status", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "model_id"
    t.bigint "group_id"
    t.index ["group_id"], name: "index_friends_on_group_id"
    t.index ["model_id"], name: "index_friends_on_model_id"
  end

  create_table "groups", options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "model_id"
    t.index ["model_id"], name: "index_groups_on_model_id"
  end

  create_table "groupuser", options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "model_id", null: false
    t.bigint "group_id", null: false
    t.index ["group_id"], name: "index_groupuser_on_group_id"
    t.index ["model_id"], name: "index_groupuser_on_model_id"
  end

  create_table "invitations", options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "owner_id"
    t.bigint "model_id", null: false
    t.bigint "group_id", null: false
    t.index ["group_id"], name: "index_invitations_on_group_id"
    t.index ["model_id"], name: "index_invitations_on_model_id"
    t.index ["owner_id"], name: "index_invitations_on_owner_id"
  end

  create_table "models", options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "name", default: "", null: false
    t.boolean "type", default: false
    t.string "profileimage"
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_models_on_email", unique: true
    t.index ["reset_password_token"], name: "index_models_on_reset_password_token", unique: true
  end

  create_table "notifcations", options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.string "link"
    t.string "title", limit: 50, default: "", null: false
    t.string "color", default: "blue"
    t.string "text", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "orders", options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.string "meal", limit: 50, null: false
    t.string "resturant", limit: 50, null: false
    t.string "image", limit: 50
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "model_id"
    t.index ["model_id"], name: "index_orders_on_model_id"
  end

  create_table "orderuser", options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "model_id", null: false
    t.bigint "order_id", null: false
    t.index ["model_id"], name: "index_orderuser_on_model_id"
    t.index ["order_id"], name: "index_orderuser_on_order_id"
  end

  add_foreign_key "friends", "groups"
  add_foreign_key "friends", "models"
  add_foreign_key "groups", "models"
  add_foreign_key "groupuser", "groups"
  add_foreign_key "groupuser", "models"
  add_foreign_key "invitations", "groups"
  add_foreign_key "invitations", "models"
  add_foreign_key "invitations", "models", column: "owner_id"
  add_foreign_key "orders", "models"
  add_foreign_key "orderuser", "models"
  add_foreign_key "orderuser", "orders"
end
