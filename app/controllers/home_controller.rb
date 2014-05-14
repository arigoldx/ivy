class HomeController < ApplicationController
  def index
    if params[:date] then
      @date = params[:date].to_date
    else
      @date = Date.today
    end

    @lessons = Lesson.where("date = ?", @date)
    @total = @lessons.size

  end
  
  def about
  end
end
