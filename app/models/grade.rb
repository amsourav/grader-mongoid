class Grade
  include Mongoid::Document
  include Mongoid::Timestamps

  field :mark, type: Integer
  validates :mark, presence: true
  belongs_to :job
  belongs_to :teacher

end