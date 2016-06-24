class ExamsController < ApplicationController
  before_action :set_exam, only: [:show, :edit, :update, :destroy,
                                :manage, :send_reminder_mail,
                                :upload_student_attendance_sheet, :upload_test_papers]
  before_action :set_course
  before_action :authenticate_teacher!
  # GET /exams
  # GET /exams.json
  def index
    @exams = @course.exams.all
    @exam = @course.exams.new
  end

  # GET /exams/1
  # GET /exams/1.json
  def show
  end

  # GET /exams/new
  def new
    @exam = @course.exams.new
  end

  # GET /exams/1/edit
  def edit
  end

  # POST /exams
  # POST /exams.json
  def create
    @exam = @course.exams.new(exam_params)

    respond_to do |format|
      if @exam.save
        format.html { redirect_to course_exams_path(@course), notice: 'Exam was successfully created.' }
        format.html { redirect_to new_course_exam_question_path(@course, @exam), notice: 'Exam was successfully created.' }
        format.json { render :show, status: :created, location: @exam }
      else
        format.html { render :new }
        format.json { render json: @exam.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /exams/1
  # PATCH/PUT /exams/1.json
  def update
    respond_to do |format|
      if @exam.update(exam_params)
        format.html { redirect_to @exam, notice: 'Exam was successfully updated.' }
        format.json { render :show, status: :ok, location: @exam }
      else
        format.html { render :edit }
        format.json { render json: @exam.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /exams/1
  # DELETE /exams/1.json
  def destroy
    @exam.destroy
    respond_to do |format|
      format.html { redirect_to course_exams_path(@course), notice: 'Exam was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def manage
    @admitted_students = @exam.test_givers.pluck(:name, :roll, :email) || nil
    respond_to do |format|
      format.html
      format.js
    end
  end

  def send_reminder_mail
    @students = @course.students
    SendExamReminderJob.perform_now(@students, @exam)
    flash.now[:notice] = "Email Sent to all students!"
    redirect_to manage_course_exam_path(@course, @exam)
  end

  def upload_student_attendance_sheet
    if @exam.update(upload_student_attendance_sheet_params)
      ProcessAttendanceSheetJob.perform_now(@exam)
      redirect_to manage_course_exam_path(@course, @exam)
    else
      flash[:notice] = @exam.errors.full_messages.first
      redirect_to manage_course_exam_path(@course, @exam)
    end
  end

  def upload_test_papers
    if @exam.update(upload_test_papers_params)
      # ProcessTestPapersJob.perform_now(@exam)
      redirect_to manage_course_exam_path(@course, @exam)
    else
      flash[:notice] = @exam.errors.full_messages.first
      redirect_to manage_course_exam_path(@course, @exam)
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_exam
      @exam = Exam.find(params[:id])
    end

    def set_course
      @course = Course.find(params[:course_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def exam_params
      params.require(:exam).permit(:name, :date, :total_marks, :total_questions)
    end

    def upload_student_attendance_sheet_params
      params.require(:exam).permit(:attendance_sheet)
    end

    def upload_test_papers_params
      params.require(:exam).permit(:test_papers)
    end
end
