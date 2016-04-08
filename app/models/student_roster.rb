class StudentRoster
  include Mongoid::Document
  field :student_list, type: String
  mount_uploader :student_list, StudentListUploader
  belongs_to :course
end
