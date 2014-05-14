class Lesson < ActiveRecord::Base
  attr_accessor :day_of_week, :start_date, :end_date, :attendance

  belongs_to :course
  has_many :activity_logs
  has_many :coursenotes
  has_many :courseplans
  has_many :activities, :through => :activity_logs
  has_many :attendances, :dependent => :destroy

  def previous
    if (index == 0)
      return nil
    else
      lessons.at(index - 1)
    end
  end
  
  def next
    if (index + 1) == lessons.length
      return nil
    else
      lessons.at(index + 1)
    end
  end
  
  private

  def lessons
    course.lessons.order('date')
  end
  
  def index
    lessons.index(self)
  end
  

end
