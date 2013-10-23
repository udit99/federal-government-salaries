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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20131021222141) do

  create_table "agency_median_salaries", force: true do |t|
    t.string  "agency"
    t.integer "median_salary"
  end

  create_table "median_salaries", force: true do |t|
    t.string  "job_title"
    t.integer "salary"
    t.string  "agency"
  end

  create_table "salaries", force: true do |t|
    t.string  "name"
    t.string  "agency"
    t.string  "division"
    t.string  "job_title"
    t.string  "state_or_country"
    t.string  "county"
    t.string  "station"
    t.string  "plan_grade"
    t.integer "base_salary"
    t.integer "award_bonus"
    t.string  "serialid"
    t.integer "salary_segment"
    t.integer "bonus_segment"
  end

end
