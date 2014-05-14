class Course < ActiveRecord::Base
    has_many :enrollments, :dependent => :destroy
    has_many :students, :through => :enrollments
    has_many :lessons, :dependent => :destroy
#    has_many :future_lessons, :class_name => "Lesson", :conditions => "date >= date(now())", :order => "date"
    has_many :coursenotes, :dependent => :destroy
    has_many :courseplans, :dependent => :destroy
    has_many :activity_logs, :dependent => :destroy
    has_many :attendances, :dependent => :destroy
#    has_many :assignments, :class_name => "AssignmentLog", :foreign_key => "course_id", :conditions => "student_id is null", :dependent => :destroy
#    has_many :student_assignments, :class_name => "AssignmentLog", :foreign_key => "course_id", :conditions => "student_id is not null", :dependent => :destroy

    def full_name
        self.name + ' ' + self.section
    end

end
