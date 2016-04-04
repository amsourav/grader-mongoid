class Exam
  include Mongoid::Document
  include Mongoid::Timestamps
  field :name, type: String
  field :date, type: String
  mount_uploader :exam_doc, ExamDocUploader

  belongs_to :course
  has_many :jobs
  has_many :questionpaperspecs, dependent: :destroy
  accepts_nested_attributes_for :questionpaperspecs, reject_if: :all_blank, allow_destroy: true
end
