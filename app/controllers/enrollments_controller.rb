class EnrollmentsController < ApplicationController
  include ActionView::Helpers::TextHelper

  # POST /enrollments
  # POST /enrollments.xml
  def create

    count = 0
    save_status = false

    for student_id in params[:students]
      @enrollment = Enrollment.new
      @enrollment.course_id = params[:course_id]
      @enrollment.student_id = student_id
      if @enrollment.save
        save_status = true
        count += 1
      end
    end

    respond_to do |format|
      if save_status
        flash[:notice] = 'enrolled ' + pluralize(count, 'student')
        format.html { redirect_to course_url(params[:course_id]) }
        format.xml  { head :created, :location => enrollment_url(@enrollment) }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @enrollment.errors.to_xml }
      end
    end
  end

  # DELETE /enrollments/1
  # DELETE /enrollments/1.xml
  def destroy
    @enrollment = Enrollment.find(params[:id])
    student = @enrollment.student
    course_id = @enrollment.course_id
    @enrollment.destroy

    respond_to do |format|
      flash[:notice] = 'disenrolled ' + student.name_first_last
      format.html { redirect_to course_url(course_id) }
      format.xml  { head :ok }
    end
  end

  # QQQ in the create method we seem to be ignoring this
  # Never trust parameters from the scary internet, only allow the white list through.
    def enrollment_params
      params.require(:enrollment).permit(:student_id, :course_id)
    end
end
