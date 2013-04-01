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

ActiveRecord::Schema.define(:version => 20130401021810) do

  create_table "audits", :force => true do |t|
    t.integer  "auditable_id"
    t.string   "auditable_type"
    t.integer  "associated_id"
    t.string   "associated_type"
    t.integer  "user_id"
    t.string   "user_type"
    t.string   "username"
    t.string   "action"
    t.text     "audited_changes"
    t.integer  "version",         :default => 0
    t.string   "comment"
    t.string   "remote_address"
    t.datetime "created_at"
  end

  add_index "audits", ["associated_id", "associated_type"], :name => "associated_index"
  add_index "audits", ["auditable_id", "auditable_type"], :name => "auditable_index"
  add_index "audits", ["created_at"], :name => "index_audits_on_created_at"
  add_index "audits", ["user_id", "user_type"], :name => "user_index"

  create_table "authors", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "authors", ["name"], :name => "index_authors_on_name", :unique => true

  create_table "authors_resources", :id => false, :force => true do |t|
    t.integer  "author_id",   :null => false
    t.integer  "resource_id", :null => false
    t.datetime "created_at"
  end

  create_table "notes", :force => true do |t|
    t.integer  "resource_id"
    t.text     "text"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "notes", ["resource_id"], :name => "index_notes_on_resource_id"

  create_table "notifications", :force => true do |t|
    t.integer  "user_id",    :null => false
    t.string   "message",    :null => false
    t.datetime "created_at", :null => false
  end

  add_index "notifications", ["user_id"], :name => "index_notifications_on_user_id"

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

  create_table "quotations", :force => true do |t|
    t.integer  "resource_id"
    t.text     "text"
    t.integer  "from_page"
    t.integer  "to_page"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "quotations", ["resource_id"], :name => "index_quotations_on_resource_id"

  create_table "resources", :force => true do |t|
    t.integer  "user_id"
    t.integer  "relevance"
    t.string   "title"
    t.string   "type"
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

  create_table "tasks", :force => true do |t|
    t.integer  "student_id"
    t.string   "title",      :null => false
    t.integer  "progress"
    t.datetime "starts_at"
    t.datetime "ends_at"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "tasks", ["student_id"], :name => "index_tasks_on_student_id"
  add_index "tasks", ["title"], :name => "index_tasks_on_title"

  create_table "user_recommended_resources", :force => true do |t|
    t.integer  "professor_id", :null => false
    t.integer  "student_id",   :null => false
    t.integer  "resource_id",  :null => false
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  add_index "user_recommended_resources", ["professor_id", "student_id", "resource_id"], :name => "index_user_recommended_resources_on_prof_stud_res_id", :unique => true

  create_table "users", :force => true do |t|
    t.integer  "project_id"
    t.string   "name",                   :default => "", :null => false
    t.string   "type",                                   :null => false
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
