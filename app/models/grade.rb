class Grade
  include Mongoid::Document
  include Mongoid::Timestamps

  field :assigned_marks, type: Array, default: []

  belongs_to :job
  belongs_to :student
  belongs_to :teacher
  belongs_to :exam
  belongs_to :course
end
