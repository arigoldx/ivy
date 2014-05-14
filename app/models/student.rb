class Student < ActiveRecord::Base
  has_many :activity_logs, :dependent => :destroy
  has_many :assignment_logs, :dependent => :destroy
  has_many :activities, :through => :activity_logs
  has_many :attendances, :dependent => :destroy
  has_many :enrollments, :dependent => :destroy
  has_many :courses, :through => :enrollments

def complete_name
  middlename = self.middle_name != "" ? self.middle_name + " " : " "
  nickname = self.nickname != "" ? " \"" + self.nickname + "\" " : " "
  self.first_name + nickname + middlename + self.last_name
end

def name_first_last
  self.first_name + ' ' + self.last_name
end

end
