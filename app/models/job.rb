class Job
  include Mongoid::Document
  include Mongoid::Timestamps

  field :question_tag, type: String
  field :page, type: Integer
  field :max_mark, type: Integer
  field :file, type: String
  field :student_roll, type: String
  field :student_name, type: String 
  belongs_to :teacher
  belongs_to :exam
  has_one :grade
end
