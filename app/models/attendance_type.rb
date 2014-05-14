class AttendanceType < ActiveRecord::Base
  has_many :attendance, :dependent => :destroy
end
