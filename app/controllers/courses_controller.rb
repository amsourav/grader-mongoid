class CoursesController < ApplicationController
  before_action :set_course, only: [:show, :edit, :update, :destroy,
                                :upload_student_roster, :student_roster, :grade ]
  before_action :authenticate_teacher!
  # GET /courses
  # GET /courses.json
  def index
    @courses = current_teacher.courses.all.to_a + Course.find(current_teacher.jobs.pluck(:course_id).uniq)
    @course = current_teacher.courses.new
  end

  # GET /courses/1
  # GET /courses/1.json
  def show
  end

  # GET /courses/new
  def new
    @course = current_teacher.courses.new
  end

  # GET /courses/1/edit
  def edit
  end

  # POST /courses
  # POST /courses.json
  def create
    @course = current_teacher.courses.new(course_params)

    respond_to do |format|
      if @course.save
        format.html { redirect_to courses_url, notice: 'Course was successfully created.' }
        format.json { render :show, status: :created, location: @course }
      else
        format.html { render :new }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /courses/1
  # PATCH/PUT /courses/1.json
  def update
    respond_to do |format|
      if @course.update(course_params)
        format.html { redirect_to @course, notice: 'Course was successfully updated.' }
        format.json { render :show, status: :ok, location: @course }
      else
        format.html { render :edit }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /courses/1
  # DELETE /courses/1.json
  def destroy
    @course.destroy
    respond_to do |format|
      format.html { redirect_to courses_url, notice: 'Course was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  # GET /courses/:id/student_roster
  def student_roster
    @student_roster = @course.build_student_roster
  end

  # POST /courses/:id/upload_student_roster

  def upload_student_roster
    @student_roster = @course.build_student_roster(upload_student_roster_params)
    if @student_roster.save
      count = RegisterStudentToCourseJob.perform_now(@student_roster.student_list.path, @course)
      respond_to do |format|
        flash[:notice] = "#{count} new students were added!"
        format.html { redirect_to courses_url }
      end
    end
  end



  private
    # Use callbacks to share common setup or constraints between actions.
    def set_course
      @course = Course.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def course_params
      params.require(:course).permit(:code, :name, :semester, :year)
    end

    def upload_student_roster_params
      params.require(:student_roster).permit(:student_list)
    end
end
