class QuestionsController < ApplicationController
  before_action :set_question, only: [:show, :edit, :update, :destroy]
  before_action :set_course, except: [:show, :edit, :destroy]
  before_action :set_exam, except: [:show, :edit, :destroy]
  before_action :authenticate_teacher!

  # GET /questions
  # GET /questions.json
  def index
    @questions = @exam.questions.all
    @question = @exam.questions.new
  end

  # GET /questions/1
  # GET /questions/1.json
  def show
  end

  # GET /questions/new
  def new
    3.times do
      @question = @exam.questions.new
    end
  end

  # GET /questions/1/edit
  def edit
  end

  # POST /questions
  # POST /questions.json
  def create
    @question = @exam.questions.new(question_params)

    respond_to do |format|
      if @question.save
        format.html { redirect_to course_exam_questions_path(@course, @exam), notice: 'Question was successfully created.' }
        format.json { render :show, status: :created, location: @question }
      else
        format.html { render :new }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /questions/1
  # PATCH/PUT /questions/1.json
  def update
    respond_to do |format|
      if @question.update(question_params)
        format.html { redirect_to @question, notice: 'Question was successfully updated.' }
        format.json { render :show, status: :ok, location: @question }
      else
        format.html { render :edit }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /questions/1
  # DELETE /questions/1.json
  def destroy
    exam = @question.exam
    course = exam.course
    @question.destroy
    respond_to do |format|
      format.html { redirect_to course_exam_questions_url(course, exam), notice: 'Question was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_question
      @question = Question.find(params[:id])
    end

    def set_course
      @course = Course.find(params[:course_id])
    end

    def set_exam
      @exam = Exam.find(params[:exam_id])
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def question_params
      params.require(:question).permit(:tag, :mark, :pages, part_questions_attributes: [:_id, :sub_tag, :mark, :_destroy])
    end
end
