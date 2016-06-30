class Course
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Slug

  field :code, type: String
  field :name, type: String
  field :semester, type: String
  field :year, type: String

  slug :code

  belongs_to :teacher
  has_many :exams, dependent: :destroy
  has_one :student_roster
  has_and_belongs_to_many :students
end
