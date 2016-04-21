class Grade
  include Mongoid::Document
  include Mongoid::Timestamps

  field :mark, type: Integer
  field :annotation, type: String
  field :comment, type: String
  validates :mark, presence: true
  belongs_to :job
  belongs_to :teacher
  belongs_to :student
end