class Grade
  include Mongoid::Document
  include Mongoid::Timestamps

<<<<<<< HEAD
  field :mark, type: Integer
  field :annotation, type: String
  field :comment, type: String
  validates :mark, presence: true
  belongs_to :job
  belongs_to :teacher
  belongs_to :student
end
=======
  field :assigned_marks, type: Array

  belongs_to :job
  belongs_to :student
  belongs_to :teacher
  belongs_to :exam
  belongs_to :course
end
>>>>>>> test_paper_processor
