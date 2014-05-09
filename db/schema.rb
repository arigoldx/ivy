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

ActiveRecord::Schema.define(version: 20140506000828) do

  create_table "activities", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "activity_logs", force: true do |t|
    t.integer  "activity_id"
    t.integer  "course_id"
    t.integer  "student_id"
    t.integer  "lesson_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "activity_logs", ["activity_id"], name: "index_activity_logs_on_activity_id"
  add_index "activity_logs", ["course_id"], name: "index_activity_logs_on_course_id"
  add_index "activity_logs", ["lesson_id"], name: "index_activity_logs_on_lesson_id"
  add_index "activity_logs", ["student_id"], name: "index_activity_logs_on_student_id"

  create_table "attendance_types", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "attendances", force: true do |t|
    t.integer  "attendance_type_id"
    t.integer  "lesson_id"
    t.integer  "student_id"
    t.integer  "course_id"
    t.date     "date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "attendances", ["attendance_type_id"], name: "index_attendances_on_attendance_type_id"
  add_index "attendances", ["course_id"], name: "index_attendances_on_course_id"
  add_index "attendances", ["lesson_id"], name: "index_attendances_on_lesson_id"
  add_index "attendances", ["student_id"], name: "index_attendances_on_student_id"

  create_table "coursenotes", force: true do |t|
    t.integer  "lesson_id"
    t.integer  "course_id"
    t.text     "text"
    t.date     "date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "coursenotes", ["course_id"], name: "index_coursenotes_on_course_id"
  add_index "coursenotes", ["lesson_id"], name: "index_coursenotes_on_lesson_id"

  create_table "courseplans", force: true do |t|
    t.integer  "lesson_id"
    t.integer  "course_id"
    t.text     "text"
    t.date     "date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "courseplans", ["course_id"], name: "index_courseplans_on_course_id"
  add_index "courseplans", ["lesson_id"], name: "index_courseplans_on_lesson_id"

  create_table "courses", force: true do |t|
    t.string   "name"
    t.string   "section"
    t.integer  "grade"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "enrollments", force: true do |t|
    t.integer  "course_id"
    t.integer  "student_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "enrollments", ["course_id"], name: "index_enrollments_on_course_id"
  add_index "enrollments", ["student_id"], name: "index_enrollments_on_student_id"

  create_table "lessons", force: true do |t|
    t.integer  "course_id"
    t.date     "date"
    t.time     "start_time"
    t.time     "end_time"
    t.integer  "room"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "lessons", ["course_id"], name: "index_lessons_on_course_id"

  create_table "students", force: true do |t|
    t.string   "first_name"
    t.string   "middle_name"
    t.string   "last_name"
    t.string   "nickname"
    t.string   "gender"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
