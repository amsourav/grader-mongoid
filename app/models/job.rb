class Job
  include Mongoid::Document
  field :images, type: Array

  belongs_to :question
  belongs_to :student
  belongs_to :teacher
end
