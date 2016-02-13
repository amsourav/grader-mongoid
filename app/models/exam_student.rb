class ExamStudent
  include Mongoid::Document
  include Mongoid::Timestamps
  field :roll, type: String
  field :name, type: String
  field :email, type: String

  embedded_in :exam
end
