class Exam
  include Mongoid::Document
  include Mongoid::Timestamps
  #
  # include ActiveModel::Validations
  #
  # validates :test_papers, :page_count
  #
  # class PageCountValidator < ActiveModel::Validator
  #   def validate(record)
  #     debugger
  #   end
  # end

  # validate :check_upload_file, on: :update

  field :name, type: String
  field :date, type: Date
  field :total_questions, type: Integer
  field :total_marks, type: Integer

  field :attendance_sheet, type: String
  field :test_papers, type: String
  mount_uploader :attendance_sheet, AttendanceSheetUploader
  mount_uploader :test_papers, ExamDocUploader

  has_and_belongs_to_many :test_givers, class_name: 'Student'
  belongs_to :course
  has_many :questions

  def check_upload_file
    file_path = self.test_papers.file.path
    if !file_path.nil?
      p_length = PDFShaver::Document.new(file_path).length
      true_length = self.questions.pluck(:pages).sum
      if p_length != true_length
        puts "sfsjdkkkkkkkkkkkkkkkkkfYolo@"
        return false
      else
        return true
      end
    else
      return true
    end
  end
end
