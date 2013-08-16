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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130813213314) do

  create_table "combat_actions", :force => true do |t|
    t.integer  "unit_id"
    t.integer  "target_id"
    t.integer  "combat_id"
    t.string   "action"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "combat_actions", ["combat_id"], :name => "index_combat_actions_on_combat_id"
  add_index "combat_actions", ["target_id"], :name => "index_combat_actions_on_target_id"
  add_index "combat_actions", ["unit_id"], :name => "index_combat_actions_on_unit_id"

  create_table "combats", :force => true do |t|
    t.string   "status"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end
  add_index "combats", ["status"], :name => "index_combats_on_status"

  create_table "unit_images", :force => true do |t|
    t.string   "image"
    t.integer  "unit_id"
    t.integer  "order"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "unit_images", ["unit_id"], :name => "index_unit_images_on_unit_id"

  create_table "units", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.string   "type"
    t.integer  "level", default: 1
    t.integer  "experience", default: 0
    t.integer  "max_health", default: 10
    t.integer  "current_health", default: 10
    t.string   "status"
    t.string   "user_id"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  add_index "units", ["user_id"], :name => "index_units_on_user_id"

  create_table "user_combats", :force => true do |t|
    t.integer  "user_id"
    t.integer  "combat_id"
    t.string   "challange_state"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "user_combats", ["combat_id"], :name => "index_user_combats_on_combat_id"
  add_index "user_combats", ["user_id"], :name => "index_user_combats_on_user_id"
  add_index "user_combats", ["challange_state"], :name => "index_user_combats_on_challange_state"

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
