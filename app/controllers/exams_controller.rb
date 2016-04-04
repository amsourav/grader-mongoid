class ExamsController < ApplicationController
  before_action :set_exam, only: [:show, :edit, :update, :destroy, :upload_doc, :upload_doc_submit, :attendance_sheet, :upload_attendance_sheet]
  before_action :set_course
  before_action :authenticate_teacher!
  # GET /exams
  # GET /exams.json
  def index
    @exams = @course.exams.all
  end

  def upload_doc
  end

  def upload_doc_submit
    # @exam.update(upload_doc_submit_params)
    if @exam.update(upload_doc_submit_params)
      # HandleFileConversionJob.perform(@exam.exam_doc.path, @exam.questionpaperspecs.length, @exam.exam_students.length)
      # Resque.enqueue(HandleFileConversionJob.perform(@exam.exam_doc.path, @exam.questionpaperspecs.length, @exam.exam_students.length), :urgent)
      # Resque.enqueue(HandleFileConversionJob, @exam.exam_doc.path)
      HandleFileConversionJob.perform_now(@exam.exam_doc.path, @exam.questionpaperspecs, @exam.exam_students, @exam.id)
      redirect_to course_exam_path(@course, @exam)
    end
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
        format.html { redirect_to course_exam_url(@course, @exam), notice: 'Exam was successfully created.' }
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
        format.html { redirect_to course_exam_url(@course, @exam), notice: 'Exam was successfully updated.' }
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
      format.html { redirect_to course_exams_url(@course), notice: 'Exam was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def attendance_sheet
    @asheet = @exam.build_attendance_sheet
  end

  def upload_attendance_sheet
    @asheet = @exam.build_attendance_sheet(upload_attendance_sheet_params)
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
      params.require(:exam).permit(:name, :date, questionpaperspecs_attributes: [:id, :tag, :marks, :page, :teacher_id, :_destroy])
    end

    def upload_doc_submit_params
      params.require(:exam).permit(:exam_doc)
    end

    def upload_attendance_sheet_params
      params.require(:attendance_sheet).permit(:file)
    end
end
