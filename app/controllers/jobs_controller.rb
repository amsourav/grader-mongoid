class JobsController < ApplicationController
  before_action :set_job, only: [:show]
  before_action :authenticate_teacher!
  # GET /jobs
  # GET /jobs.json
  def index
    @jobs = current_teacher.jobs.order_by(:question_id => 'asce').includes([:question,
       :student, :exam, :course ])
  end

  # GET /jobs/1
  # GET /jobs/1.json
  def show
    @question = @job.question.part_questions
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_job
      @job = Job.find(params[:id])
    end
end
