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

ActiveRecord::Schema.define(:version => 20130218080310) do

  create_table "passages", :force => true do |t|
    t.text     "passage"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "words", :force => true do |t|
    t.integer  "rank"
    t.string   "word"
    t.string   "lemma"
    t.string   "pos"
    t.string   "pos_long"
    t.text     "english_definition"
    t.integer  "frequency"
    t.integer  "sum_frequency"
    t.integer  "coca_spoken_freq"
    t.integer  "coca_fiction_freq"
    t.integer  "coca_magazines_freq"
    t.integer  "coca_newspapers_freq"
    t.boolean  "sat"
    t.boolean  "gre"
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
  end

end
