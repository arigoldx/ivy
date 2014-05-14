class Lesson < ActiveRecord::Base
  attr_accessor :day_of_week, :start_date, :end_date, :attendance

  belongs_to :course
  has_many :activity_logs
  has_many :coursenotes
  has_many :courseplans
  has_many :activities, :through => :activity_logs
  has_many :attendances, :dependent => :destroy

  def previous
    lessons = course.lessons.order('date')
    index = lessons.index(self)

    if (index == 0)
      return nil
    else
      lessons.at(index - 1)
    end
  end
  
  def next
    lessons = course.lessons.order('date')
    index = lessons.index(self)
    
    if (index + 1) == lessons.length
      return nil
    else
      lessons.at(index + 1)
    end
  end

end
