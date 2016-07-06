class JobsController < ApplicationController
  before_action :set_job, only: [:show]
  before_action :set_exam
  before_action :set_course
  before_action :authenticate_teacher!
  # GET /jobs
  # GET /jobs.json
  def index
    @jobs = current_teacher.jobs.where(exam_id: @exam.id).
          order_by(:question_id => 'asce').
          includes([:student, :question])
  end

  # GET /jobs/1
  # GET /jobs/1.json
  def show
    @question = @job.question
    @pqs = @job.question.part_questions
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_job
      @job = Job.find(params[:id])
    end

    def set_exam
      @exam = Exam.find(params[:exam_id])
    end

    def set_course
      @course = Course.find(params[:course_id])
    end
end
