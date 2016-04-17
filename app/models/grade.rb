class Grade
  include Mongoid::Document
  include Mongoid::Timestamps

  field :mark, type: Integer
  belongs_to :job
  belongs_to :teacher

end