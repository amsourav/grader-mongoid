class Exam
  include Mongoid::Document
  field :name, type: String
  field :date, type: Date

  belongs_to :course  
end
