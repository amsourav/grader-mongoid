class Exam
  include Mongoid::Document
  field :name, type: String
  field :date, type: String

  belongs_to :course
end
