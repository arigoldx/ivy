class Courseplan < ActiveRecord::Base
  belongs_to :lesson
  belongs_to :course
end
