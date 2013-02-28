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

ActiveRecord::Schema.define(:version => 20130228130819) do

  create_table "notifications", :force => true do |t|
    t.integer  "user_id",    :null => false
    t.string   "message",    :null => false
    t.datetime "created_at", :null => false
  end

  create_table "projects", :force => true do |t|
    t.integer  "professor_id"
    t.string   "title",        :null => false
    t.text     "summary"
    t.date     "due_at"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  add_index "projects", ["professor_id"], :name => "index_projects_on_professor_id"
  add_index "projects", ["title"], :name => "index_projects_on_title"

  create_table "resources", :force => true do |t|
    t.integer  "user_id"
    t.integer  "relevance"
    t.string   "title"
    t.string   "publisher"
    t.string   "year"
    t.string   "file"
    t.string   "issue"
    t.string   "volume"
    t.integer  "isbn"
    t.date     "accessed_at"
    t.date     "read_at"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "resources", ["title"], :name => "index_resources_on_title"
  add_index "resources", ["user_id"], :name => "index_resources_on_user_id"

  create_table "users", :force => true do |t|
    t.integer  "project_id"
    t.string   "name",                   :default => "", :null => false
    t.string   "type"
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
