class JobsController < ApplicationController
  before_action :authenticate_teacher!
  before_action :set_job, except: [:grade, :grade_submit, :index]
  before_action :set_grade_job, only: [:grade, :grade_submit]

  def index
  	@jobs = current_teacher.jobs
  end

  def show
  end

  def new
  end

  def grade
    @grade = @job.build_grade
    @grade.teacher_id = current_teacher.id
  end

  def grade_submit
    @grade = Grade.new(grade_submit_params) 
    if @grade.save
      redirect_to @job
    end  
  end

  def create
  end


  private

  def grade_submit_params
    params.require(:grade).permit(:mark, :teacher_id, :job_id)
  end

  def set_job
    @job= Job.find(params[:id])
  end

  def set_grade_job
    @job = Job.find(params[:job_id])
  end

end
