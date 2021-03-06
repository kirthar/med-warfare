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

ActiveRecord::Schema.define(:version => 20130831185743) do

  create_table "combat_actions", :force => true do |t|
    t.integer  "unit_id"
    t.integer  "target_id"
    t.integer  "combat_id"
    t.string   "action"
    t.string   "result"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "combat_actions", ["combat_id"], :name => "index_combat_actions_on_combat_id"
  add_index "combat_actions", ["target_id"], :name => "index_combat_actions_on_target_id"
  add_index "combat_actions", ["unit_id"], :name => "index_combat_actions_on_unit_id"

  create_table "combats", :force => true do |t|
    t.integer  "current_unit_id"
    t.string   "status"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "friendships", :force => true do |t|
    t.integer  "user_id"
    t.integer  "friend_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

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
    t.integer  "level",           :default => 1
    t.integer  "experience",      :default => 0
    t.integer  "max_health",      :default => 13
    t.integer  "current_health",  :default => 13
    t.integer  "initiative",      :default => 10
    t.integer  "strength",        :default => 10
    t.integer  "dexterity",       :default => 10
    t.integer  "intelligence",    :default => 10
    t.integer  "physical_resist", :default => 0
    t.integer  "magical_resist",  :default => 0
    t.string   "status"
    t.integer  "user_id"
    t.datetime "created_at",                      :null => false
    t.datetime "updated_at",                      :null => false
  end

  add_index "units", ["id", "type"], :name => "index_units_on_id_and_type"
  add_index "units", ["id"], :name => "index_units_on_id"

  create_table "user_combats", :force => true do |t|
    t.integer  "user_id"
    t.integer  "combat_id"
    t.string   "challange_state"
    t.datetime "pending_since"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  add_index "user_combats", ["combat_id"], :name => "index_user_combats_on_combat_id"
  add_index "user_combats", ["user_id"], :name => "index_user_combats_on_user_id"

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "",    :null => false
    t.string   "encrypted_password",     :default => "",    :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                                :null => false
    t.datetime "updated_at",                                :null => false
    t.string   "username"
    t.boolean  "admin",                  :default => false
    t.string   "provider"
    t.string   "uid"
    t.string   "name"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true
  add_index "users", ["username"], :name => "index_users_on_username", :unique => true

end
