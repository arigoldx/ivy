class Attendance < ActiveRecord::Base
  belongs_to :attendance_type
  belongs_to :lesson
  belongs_to :student
  belongs_to :course
end
