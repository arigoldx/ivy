class Lesson < ActiveRecord::Base
  belongs_to :course
  
  has_many :activity_logs
  has_many :coursenotes
  has_many :courseplans
  has_many :activities, :through => :activity_logs
  has_many :attendances, :dependent => :destroy
  
  def self.todays(date)
    self.order("start_time")
  end
  
end
