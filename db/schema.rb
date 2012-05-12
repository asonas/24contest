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

ActiveRecord::Schema.define(:version => 20120512083033) do

  create_table "anniversaries", :force => true do |t|
    t.integer  "user_id"
    t.string   "anniversary"
    t.string   "description"
    t.string   "anniversary_date"
    t.integer  "tweet_id"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  add_index "anniversaries", ["user_id"], :name => "index_anniversaries_on_user_id"

  create_table "users", :force => true do |t|
    t.string   "uid"
    t.string   "twitter_id"
    t.string   "icon_url"
    t.string   "access_token"
    t.string   "access_secret"
    t.string   "provider"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.text     "description"
  end

end
