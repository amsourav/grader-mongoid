class JobsController < ApplicationController
  before_action :set_job, only: [:show, :post_grade]
  before_action :set_exam
  before_action :set_course
  before_action :authenticate_teacher!
  # GET /jobs
  # GET /jobs.json
  def index
    @jobs = current_teacher.jobs.where(exam_id: @exam.id).
          order_by(:question_id => 'asce').
          includes([:student, :question, :grade])
  end

  # GET /jobs/1
  # GET /jobs/1.json
  def show
    @question = @job.question
    @pqs = @job.question.part_questions
    @grade = Grade.new(
                      assigned_marks: Array.new(@pqs.count),
                      teacher_id: current_teacher.id,
                      student_id: @job.student.id,
                      course_id: @course.id,
                      job_id: @job.id,
                      exam_id: @exam.id
                      )
  end

  def progress
    @jobs = @exam.jobs
    questions_id = @jobs.pluck(:question).uniq
    @questions = Question.find(questions_id)
  end

  def post_grade
    # Add some validations
    @question = @job.question
    @pqs = @job.question.part_questions
  assigned_marks = post_grade_params[:assigned_marks].split(',').map(&:to_i)[0..@pqs.count-1]
    if @job.grade == nil
      @grade = Grade.new(assigned_marks: assigned_marks,
                        teacher_id: current_teacher.id,
                        student_id: @job.student.id,
                        course_id: @course.id,
                        job_id: @job.id,
                        exam_id: @exam.id
                        )
        if @grade.save
            redirect_to @job.next(current_teacher.id, @exam.id) ? course_exam_job_path(@course, @exam, @job.next(current_teacher.id,
            @exam)) : course_exam_jobs_path(@course, @exam)
        else
          redirect_to course_exam_job_path(@course, @exam, @job)
        end
    else
      @job.grade.update_attributes(assigned_marks: assigned_marks)
      redirect_to @job.next(current_teacher.id, @exam.id) ? course_exam_job_path(@course, @exam, @job.next(current_teacher.id,
      @exam)) : course_exam_jobs_path(@course, @exam)
    end
  end

  def patch_grade
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_job
      @job = Job.find(params[:id]).includes(:grade)
    end

    def set_exam
      @exam = Exam.find(params[:exam_id])
    end

    def set_course
      @course = Course.find(params[:course_id])
    end

    def post_grade_params
      params.require(:grade).permit(:assigned_marks, :teacher_id, :student_id,
                                     :course_id, :job_id, :exam_id)
    end
end
