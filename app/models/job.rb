class Job
  include Mongoid::Document
  include Mongoid::Timestamps

  field :file, type: String
  field :student_roll, type: String
  field :student_name, type: String 
  belongs_to :teacher
  belongs_to :exam
end
