class JobsController < ApplicationController
  before_action :authenticate_teacher!
  before_action :set_job, except: [:grade, :grade_submit, :index]
  before_action :set_jobs, only: [:index, :grade_submit]
  before_action :set_grade_job, only: [:grade, :grade_submit]

  def index
  end

  def show
  end

  def new
  end

  def grade
    if current_teacher.id == @job.teacher.id
      @grade = @job.build_grade
      @grade.teacher_id = @job.teacher.id
    end
  end

  def grade_submit
    @grade = Grade.new(grade_submit_params) 
    if @grade.save
      redirect_to job_grade_path(@job.next)
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

  def set_jobs
    @jobs = current_teacher.jobs
  end

end
