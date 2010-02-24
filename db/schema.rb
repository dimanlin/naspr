# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20100224123315) do

  create_table "comments", :force => true do |t|
    t.integer  "user_id"
    t.integer  "debate_id"
    t.text     "message"
    t.boolean  "voted"
    t.boolean  "check",      :default => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "contacts", :force => true do |t|
    t.string   "from"
    t.string   "email"
    t.text     "message"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "contents", :force => true do |t|
    t.string   "name"
    t.string   "header"
    t.text     "text"
    t.string   "urlname"
    t.string   "permalink"
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "debates", :force => true do |t|
    t.string   "header"
    t.integer  "user_id"
    t.text     "message"
    t.boolean  "alert",      :default => false
    t.boolean  "check",      :default => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "login",                                  :null => false
    t.string   "nick"
    t.string   "crypted_password",                       :null => false
    t.string   "password_salt",                          :null => false
    t.boolean  "master",              :default => false
    t.string   "persistence_token",                      :null => false
    t.string   "single_access_token",                    :null => false
    t.string   "perishable_token",                       :null => false
    t.integer  "login_count",         :default => 0,     :null => false
    t.integer  "failed_login_count",  :default => 0,     :null => false
    t.datetime "last_request_at"
    t.datetime "current_login_at"
    t.datetime "last_login_at"
    t.string   "current_login_ip"
    t.string   "last_login_ip"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
