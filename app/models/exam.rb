class Exam
  include Mongoid::Document
  include Mongoid::Timestamps
  field :name, type: String
  field :date, type: String
  field :student_list, type: String
  mount_uploader :student_list, StudentListUploader

  belongs_to :course
  embeds_many :exam_students

  has_many :questionpaperspecs, dependent: :destroy
  accepts_nested_attributes_for :questionpaperspecs, reject_if: :all_blank, allow_destroy: true
end
