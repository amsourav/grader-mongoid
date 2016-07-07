class Exam
  include Mongoid::Document
  include Mongoid::Timestamps
<<<<<<< HEAD
=======
  include Mongoid::Slug


>>>>>>> test_paper_processor
  field :name, type: String
  field :date, type: String
  field :page_size, type: Integer

  belongs_to :course
<<<<<<< HEAD
  has_many :jobs
  # for attendance
  # has_and_belongs_to_many :students
  has_one :attendance_sheet
  has_one :exam_doc
  has_many :questionpaperspecs, dependent: :destroy
  accepts_nested_attributes_for :questionpaperspecs, reject_if: :all_blank, allow_destroy: true
=======
  has_many :questions, dependent: :destroy
  has_many :jobs, dependent: :destroy
  has_many :grades, dependent: :destroy

>>>>>>> test_paper_processor
end
