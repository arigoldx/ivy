class LessonsController < ApplicationController
  before_action :set_lesson, only: [:show, :edit, :update, :destroy]

  # GET /lessons
  # GET /lessons.json
  def index
    @lessons = Lesson.all
  end

  # GET /lessons/1
  # GET /lessons/1.json
  def show
    @attendance_types = AttendanceType.all
    @attendance = Attendance.new
    @me = Lesson.find(params[:id])
    @course = @me.course
    @lesson_array = @course.lessons.order("date")
    @lessons = @me.course.lessons.where(:order => "date", :conditions => "date >= Date(now())")
  end

  # GET /lessons/new
  def new
    @lesson = Lesson.new
    # if we're creating the lesson from a course, use that id
    # QQQ
    @course = Course.find(params[:course_id])
  end

  # GET /lessons/1/edit
  def edit
  end

  # POST /lessons
  # POST /lessons.json
  def create
    if params[:lesson][:day_of_week]
      @end_date = Date.new_from_select params, "lesson", "end_date"
      @current_date = Date.new_from_select params, "lesson", "start_date"
 
      while @current_date.cwday != params[:lesson][:day_of_week].to_i
        @current_date += 1
      end
      while @current_date <= @end_date
        @lesson = Lesson.new(lesson_params)
        @lesson.date = @current_date
        @current_date += 7
        @lesson.save
      end
      flash[:notice] = 'your batch of lessons was successfully created'
      redirect_to course_url(params[:lesson][:course_id])
    else
      @lesson = Lesson.new(lesson_params)

      respond_to do |format|
        if @lesson.save
          format.html { redirect_to lessons_path, notice: 'lesson was successfully created.' }
          format.json { render :show, status: :created, location: @lesson }
        else
          format.html { render :new }
          format.json { render json: @lesson.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # PATCH/PUT /lessons/1
  # PATCH/PUT /lessons/1.json
  def update
    respond_to do |format|
      if @lesson.update(lesson_params)
        format.html { redirect_to @lesson, notice: 'lesson was successfully updated.' }
        format.json { render :show, status: :ok, location: @lesson }
      else
        format.html { render :edit }
        format.json { render json: @lesson.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lessons/1
  # DELETE /lessons/1.json
  def destroy
    @lesson.destroy
    respond_to do |format|
      format.html { redirect_to lessons_url, notice: 'lesson was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lesson
      @lesson = Lesson.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def lesson_params
      params.require(:lesson).permit(:course_id, :date, :start_time, :end_time, :room)
    end
end
