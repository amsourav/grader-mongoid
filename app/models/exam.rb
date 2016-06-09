class Exam
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name, type: String
  field :date, type: Date
  field :total_questions, type: Integer
  field :total_marks, type: Integer


  belongs_to :course
  has_many :questions
end
