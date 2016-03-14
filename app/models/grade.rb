class Grade
  include Mongoid::Document
  include Mongoid::Timestamps
  field :mark, type: Integer

  belongs_to :teacher
  belongs_to :job
end
