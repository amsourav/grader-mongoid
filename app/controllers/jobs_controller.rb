class JobsController < ApplicationController
  before_action :authenticate_teacher!
  before_action :set_job, except: [:grade, :grade_submit, :index]
  before_action :set_jobs, only: [:index, :grade_submit]
  before_action :set_grade_job, only: [:grade, :grade_submit]


  def home
  end

  def index
  end

  def show
    if !@job.grade?
      redirect_to job_grade_path(@job)
    end
  end

  def new
  end

  def grade
    if @job.grade?
      redirect_to job_path(@job)
    end

    if current_teacher.id == @job.teacher.id
      @grade = @job.build_grade
      @grade.teacher_id = @job.teacher.id
    end
  end

  def grade_submit
    @grade = Grade.new(grade_submit_params) 
    if @grade.save
      redirect_to job_grade_path(@job.next(current_teacher.id))
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
    @jobs = current_teacher.jobs.order_by(:file => 'asce' )
  end

end
