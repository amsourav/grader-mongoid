class TeacherProfile
  include Mongoid::Document
  include Mongoid::Timestamps
  field :name, type: String
  field :teacher_avatar, type: String
  embedded_in :teacher
end
