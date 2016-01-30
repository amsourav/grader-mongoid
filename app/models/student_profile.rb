class StudentProfile
  include Mongoid::Document
  field :name, type: String
  field :roll, type: String
  field :avatar, type: String

  embedded_in :student
end
