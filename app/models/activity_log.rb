class ActivityLog < ActiveRecord::Base
  belongs_to :activity
  belongs_to :course
  belongs_to :student
  belongs_to :lesson
end
