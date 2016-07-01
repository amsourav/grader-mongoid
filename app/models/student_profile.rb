class StudentProfile
  include Mongoid::Document
  include Mongoid::Timestamps
  field :name, type: String
  field :role, type: String
  field :student_avatar, type: String

  belongs_to :student
end
