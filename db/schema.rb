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

ActiveRecord::Schema.define(:version => 20130224231724) do

  create_table "author_references", :force => true do |t|
    t.integer  "author_id"
    t.integer  "reference_id"
    t.datetime "created_at"
  end

  add_index "author_references", ["author_id"], :name => "index_author_references_on_author_id"
  add_index "author_references", ["reference_id"], :name => "index_author_references_on_reference_id"

  create_table "authors", :force => true do |t|
    t.string   "name",       :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "authors", ["name"], :name => "index_authors_on_name"

  create_table "notes", :force => true do |t|
    t.integer  "reference_id", :null => false
    t.text     "text",         :null => false
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  add_index "notes", ["reference_id"], :name => "index_notes_on_reference_id"

  create_table "projects", :force => true do |t|
    t.integer  "user_id",    :null => false
    t.string   "name",       :null => false
    t.text     "summary"
    t.datetime "due_at"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "projects", ["name"], :name => "index_projects_on_name"
  add_index "projects", ["user_id"], :name => "index_projects_on_user_id"

  create_table "quotations", :force => true do |t|
    t.integer  "reference_id", :null => false
    t.text     "text",         :null => false
    t.integer  "from_page"
    t.integer  "to_page"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  add_index "quotations", ["reference_id"], :name => "index_quotations_on_reference_id"

  create_table "references", :force => true do |t|
    t.integer  "user_id",     :null => false
    t.integer  "relevance"
    t.string   "title",       :null => false
    t.string   "publisher"
    t.integer  "year"
    t.string   "volume"
    t.string   "issue"
    t.integer  "isbn"
    t.datetime "accessed_at"
    t.datetime "read_at"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "references", ["title"], :name => "index_references_on_title"
  add_index "references", ["user_id"], :name => "index_references_on_user_id"

  create_table "roles", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "roles", ["name"], :name => "index_roles_on_name"

  create_table "suggested_references", :force => true do |t|
    t.integer  "proposer_id",  :null => false
    t.integer  "proposee_id",  :null => false
    t.integer  "reference_id", :null => false
    t.datetime "created_at"
  end

  add_index "suggested_references", ["proposer_id", "proposee_id", "reference_id"], :name => "suggested_references_proposer_id_reference_id", :unique => true

  create_table "taggings", :force => true do |t|
    t.integer  "tag_id",                       :null => false
    t.integer  "taggable_id"
    t.string   "taggable_type"
    t.integer  "tagger_id"
    t.string   "tagger_type"
    t.string   "context",       :limit => 128
    t.datetime "created_at"
  end

  add_index "taggings", ["tag_id"], :name => "index_taggings_on_tag_id"
  add_index "taggings", ["taggable_id", "taggable_type", "context"], :name => "index_taggings_on_taggable_id_and_taggable_type_and_context"

  create_table "tags", :force => true do |t|
    t.string "name", :null => false
  end

  add_index "tags", ["name"], :name => "index_tags_on_name", :unique => true

  create_table "tasks", :force => true do |t|
    t.integer  "user_id"
    t.string   "title"
    t.datetime "due_at"
    t.integer  "duration"
    t.string   "duration_unit"
    t.integer  "progress"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "tasks", ["title"], :name => "index_tasks_on_title"
  add_index "tasks", ["user_id"], :name => "index_tasks_on_user_id"

  create_table "users", :force => true do |t|
    t.integer  "project_id"
    t.integer  "role_id",                                :null => false
    t.string   "name",                                   :null => false
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
  add_index "users", ["role_id"], :name => "index_users_on_role_id"

end
