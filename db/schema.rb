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

ActiveRecord::Schema.define(:version => 20120525191321) do

  create_table "teams", :force => true do |t|
    t.string   "country"
    t.integer  "won",        :default => 0
    t.integer  "lost",       :default => 0
    t.integer  "draw",       :default => 0
    t.integer  "group_cd"
    t.boolean  "last_16"
    t.boolean  "last_8"
    t.boolean  "last_4"
    t.boolean  "last_2"
    t.integer  "place"
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
  end

  add_index "teams", ["country"], :name => "index_teams_on_country"
  add_index "teams", ["group_cd"], :name => "index_teams_on_group_cd"
  add_index "teams", ["place"], :name => "index_teams_on_place"

  create_table "users", :force => true do |t|
    t.string   "email"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "username"
    t.string   "image_url"
    t.string   "large_image_url"
    t.string   "small_image_url"
    t.string   "square_image_url"
    t.string   "facebook_idx"
    t.integer  "score"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  add_index "users", ["email"], :name => "index_users_on_email"
  add_index "users", ["facebook_idx"], :name => "index_users_on_facebook_idx"
  add_index "users", ["score"], :name => "index_users_on_score"

end
