class ExamDoc
  include Mongoid::Document

  field :file, type: String
  mount_uploader :file, ExamDocUploader

  belongs_to :exam
end
