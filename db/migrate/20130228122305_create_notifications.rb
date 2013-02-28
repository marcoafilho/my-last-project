class CreateNotifications < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
      t.references :user, null: false
      t.string :message, null: false
      
      t.datetime :created_at, null: false
    end
  end
end
