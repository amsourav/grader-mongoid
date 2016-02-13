class Exam
  include Mongoid::Document
  include Mongoid::Timestamps
  field :name, type: String
  field :date, type: String
  field :student_list, type: String
  field :total_marks, type: Integer
  field :total_pages, type: Integer
  mount_uploader :student_list, StudentListUploader
  mount_uploader :exam_doc, ExamDocUploader

  belongs_to :course
  embeds_many :exam_students

  has_many :questionpaperspecs, dependent: :destroy
  accepts_nested_attributes_for :questionpaperspecs, reject_if: :all_blank, allow_destroy: true
end
