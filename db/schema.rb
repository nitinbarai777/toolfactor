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

ActiveRecord::Schema.define(:version => 20120807072200) do

  create_table "ages", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "factors", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "tool_ages", :force => true do |t|
    t.integer  "tool_id"
    t.integer  "age_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "tool_ages", ["age_id"], :name => "index_tool_ages_on_age_id"
  add_index "tool_ages", ["tool_id"], :name => "index_tool_ages_on_tool_id"

  create_table "tool_factors", :force => true do |t|
    t.integer  "tool_id"
    t.integer  "factor_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "tool_factors", ["factor_id"], :name => "index_tool_factors_on_factor_id"
  add_index "tool_factors", ["tool_id"], :name => "index_tool_factors_on_tool_id"

  create_table "tool_reports", :force => true do |t|
    t.string   "browser_agent"
    t.string   "age"
    t.string   "factors"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "tools", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.string   "image"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "user_sessions", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "username"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "mobile_number"
    t.string   "carrier_id",        :limit => 4
    t.integer  "gateway_id"
    t.string   "email"
    t.string   "crypted_password"
    t.string   "password_salt"
    t.string   "persistence_token"
    t.string   "address"
    t.string   "city"
    t.string   "state"
    t.string   "zipcode"
    t.string   "contact"
    t.string   "image"
    t.integer  "is_admin"
    t.boolean  "is_active",                      :default => true
    t.datetime "created_at",                                       :null => false
    t.datetime "updated_at",                                       :null => false
  end

  add_index "users", ["carrier_id"], :name => "index_users_on_carrier_id"
  add_index "users", ["gateway_id"], :name => "index_users_on_gateway_id"

end
