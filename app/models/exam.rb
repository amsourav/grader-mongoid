class Exam
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Slug


  field :name, type: String
  field :date, type: Date
  field :total_questions, type: Integer
  field :total_marks, type: Integer

  field :attendance_sheet, type: String
  field :test_papers, type: String
  mount_uploader :attendance_sheet, AttendanceSheetUploader
  mount_uploader :test_papers, ExamDocUploader

  slug :name, scope: :course

  has_and_belongs_to_many :test_givers, class_name: 'Student'
  belongs_to :course
  has_many :questions, dependent: :destroy
  has_many :jobs, dependent: :destroy
  has_many :grades, dependent: :destroy

end
