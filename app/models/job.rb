class Job
  include Mongoid::Document
  include Mongoid::Timestamps

  field :question_tag, type: String
  field :page, type: Integer
  field :max_mark, type: Integer
  field :file, type: Array

  belongs_to :teacher
  belongs_to :exam
  belongs_to :student
end
