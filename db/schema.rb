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

ActiveRecord::Schema.define(:version => 20120527195332) do

  create_table "bets", :force => true do |t|
    t.integer  "game_id"
    t.integer  "user_id"
    t.integer  "team_a_goals"
    t.integer  "team_b_goals"
    t.integer  "score"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  add_index "bets", ["game_id"], :name => "index_bets_on_game_id"
  add_index "bets", ["score"], :name => "index_bets_on_score"
  add_index "bets", ["user_id"], :name => "index_bets_on_user_id"

  create_table "games", :force => true do |t|
    t.integer  "team_a_id"
    t.integer  "team_b_id"
    t.datetime "start_at"
    t.datetime "end_at"
    t.integer  "team_a_goals"
    t.integer  "team_b_goals"
    t.integer  "team_a_penalty_goals"
    t.integer  "team_b_penalty_goals"
    t.integer  "team_a_halftime_goals"
    t.integer  "team_b_halftime_goals"
    t.integer  "group_cd"
    t.integer  "finals_cd"
    t.text     "comment"
    t.datetime "created_at",            :null => false
    t.datetime "updated_at",            :null => false
    t.integer  "oldb_idx"
  end

  add_index "games", ["end_at"], :name => "index_games_on_end_at"
  add_index "games", ["finals_cd"], :name => "index_games_on_finals_cd"
  add_index "games", ["group_cd"], :name => "index_games_on_group_cd"
  add_index "games", ["oldb_idx"], :name => "index_games_on_oldb_idx"
  add_index "games", ["start_at"], :name => "index_games_on_start_at"
  add_index "games", ["team_a_goals"], :name => "index_games_on_team_a_goals"
  add_index "games", ["team_a_id"], :name => "index_games_on_team_a_id"
  add_index "games", ["team_b_goals"], :name => "index_games_on_team_b_goals"
  add_index "games", ["team_b_id"], :name => "index_games_on_team_b_id"

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
    t.string   "locale"
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
